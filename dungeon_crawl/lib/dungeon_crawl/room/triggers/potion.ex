defmodule DungeonCrawl.Room.Triggers.Potion do
  @behaviour DungeonCrawl.Room.Trigger

  alias Mix.Shell.IO, as: Shell

  def run(character, %DungeonCrawl.Room.Action{id: :heal}) do

    potion = Enum.random(1..10)

    Shell.info("You've found a healing potion")
    Shell.info("Looks good, you drink it to rejuvenate yourself")
    updated_char = DungeonCrawl.Heal.heal(character, potion)

    {updated_char, :forward}

  end




end
