defmodule DungeonCrawl.Room.Triggers.Search do
  @behaviour DungeonCrawl.Room.Trigger

  import DungeonCrawl.CLI.BaseCommands

  alias Mix.Shell.IO, as: Shell

  def run(character, {room,%DungeonCrawl.Room.Action{id: :search}}) do
    room_items= room.items

    find_item_by_index = &(Enum.at(room_items, &1))

    Shell.info("You rummage around the room and find...")

    room_items
    |>Enum.map(&(&1.name))
    |>display_options
    |>generate_question
    |>Shell.prompt
    |>parse_answer
    |>find_item_by_index.()
    |>DungeonCrawl.Room.Triggers.PickUp.run(character, %DungeonCrawl.Room.Action{id: :pick_up})

    {character, :forward}
  end




end
