defmodule DungeonCrawl.CLI.ItemChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start(character) do
    character_items = character.items
    find_item_by_index = &(Enum.at(character_items, &1))

    Shell.info("A new room, let's see what items you can use")

    chosen_item =
    character_items
    |>Enum.map(&(&1.label))
    |>display_options
    |>generate_question
    |>Shell.prompt
    |>parse_answer
    |>find_item_by_index.()


    {character, chosen_item}

  end
end
