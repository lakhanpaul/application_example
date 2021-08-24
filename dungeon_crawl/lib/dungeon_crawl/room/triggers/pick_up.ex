defmodule DungeonCrawl.Room.Triggers.PickUp do

  alias Mix.Shell.IO, as: Shell

  def run(item, character, %DungeonCrawl.Room.Action{id: :pick_up}) do

    Shell.info("You've found a #{item.name}")
    Shell.info("Could be handy later, so you put it in your satchel")
    updated_char = DungeonCrawl.PickUp.pick_up(character, item)

    {updated_char, :forward}

  end

end
