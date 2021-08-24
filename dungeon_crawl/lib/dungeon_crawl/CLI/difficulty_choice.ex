# Implementing difficulty choice
# 1. Ask player to choose a difficulty option
# 2. Retrieve the player response
# 3. Use the player response to update the probabilities of rooms
#     Increased probability if they are beneficial, and decrease if they are not

defmodule DungeonCrawl.CLI.DifficultyChoice do
  alias Mix.Shell.IO, as: Shell

  import DungeonCrawl.CLI.BaseCommands

  def start(rooms) do
    Shell.cmd("")
    Shell.info("Choose your difficulty level")

    difficulties = ["easy", "normal", "hard"]
    find_difficulty_by_index = &Enum.at(difficulties, &1)

    difficulties
    |> Enum.map(&(&1))
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_difficulty_by_index.()
    |> confirm_difficulty(rooms)
    |> update_room_probabilities(rooms)
  end

  defp confirm_difficulty(chosen_difficulty, rooms) do
    Shell.cmd("")
    Shell.info(chosen_difficulty)
    if Shell.yes?("Confirm?"), do: chosen_difficulty, else: start(rooms)
  end

  defp update_room_probabilities(difficulty, rooms) do
    DungeonCrawl.Difficulty.update_game(difficulty, rooms)
  end


end
