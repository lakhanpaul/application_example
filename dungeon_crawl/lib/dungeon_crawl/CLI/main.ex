defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press enter to continue")
    updated_rooms = difficulty_choice(DungeonCrawl.Room.all())
    crawl(hero_choice(),updated_rooms,0)
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awaken in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit")
  end

  defp difficulty_choice(rooms) do
    DungeonCrawl.CLI.DifficultyChoice.start(rooms)
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(character = %{hit_points: 0}, _, _) do
    Shell.prompt("")
    Shell.info("Your wounds are too severe for you to keep walking")
    Shell.info("You fall to the floor, into a crimson bed of your own blood")
    Shell.info("You died with a score of #{character.score}")
    DungeonCrawl.File.use_file("high-scores.txt", character.score)
    Shell.cmd("high-scores.txt")
    Shell.info("Game over, your score has been saved in high-scores.txt")
    Shell.prompt("")
  end

  defp crawl(character,rooms,number_of_movements) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")

    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |>random_item
    |>DungeonCrawl.CLI.RoomActionsChoice.start
    |>trigger_action(character)
    |>handle_action_result(rooms)
  end

  def random_item(list) do
    # you could add an id to the probabilty and make it a tuple if you wanted rooms with the same probability
    list_of_probability_lists = Enum.map(list, fn item -> create_probability_list(item.probability, item.probability) end)
    probability_list = List.flatten(list_of_probability_lists)
    room_number = Enum.random(probability_list)
    room = Enum.fetch!(Enum.filter(list, fn item -> match?(%{probability: ^room_number}, item) end), 0)
  end

  def filter_items(item, filter_value) do
    match?(%{probability: ^filter_value}, item)
  end

  def create_probability_list(number, counter) when counter > 0 do
    [number|create_probability_list(number, counter-1)]
  end

  def create_probability_list(number, 0) do
    []
  end


  defp use_item({character, chosen_item}) do
    DungeonCrawl.Use.use_item(character, chosen_item)
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("")
    action_id = action.id
    {_, trigger_map} = Enum.fetch(Enum.filter(room.triggers, fn item -> match?(%{action: ^action_id}, item) end), 0)
    %{trigger: trigger_value} = trigger_map
    trigger_value.run(character, {room, action})
  end

  defp handle_action_result({_, :exit},_) do
    Shell.info("You round the exit, and won the game!!")
  end

  defp handle_action_result({character, _}, rooms) do
    updated_rooms = DungeonCrawl.Difficulty.update_game("crawl", rooms)
    crawl(character, DungeonCrawl.Room.all(), updated_rooms)
  end

end
