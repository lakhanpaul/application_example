defmodule DungeonCrawl.Heal do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def heal(character, potion) do
    healing_message(potion)
    Character.heal(character, potion)
  end

  defp healing_message(potion) do
    Shell.info("You are now healed, and have #{potion} more hit points")
  end

end
