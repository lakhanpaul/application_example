defmodule DungeonCrawl.Use do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def use_item(character, item) do
    item_type = item.type
    item_value = item.value
    using_item(character, item_type, item_value)
  end

  defp using_item(character, :heal, item_value) do
    Character.heal(character, item_value)
    Character.use_item(character, item)
  end

end
