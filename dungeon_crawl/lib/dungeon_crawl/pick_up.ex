defmodule DungeonCrawl.PickUp do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def pick_up(character, item) do
    pick_up_message(item)
    Character.pick_up(character, item)
  end

  defp pick_up_message(item) do
    Shell.info("You have picked up a #{item.name}, which #{item.description} ")
  end

end
