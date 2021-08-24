defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all do
    [%Character{name: "Wizard", description: "Magic guy who likes nuggets", hit_points: 8, max_hit_points: 8, damage_range: 6..10, attack_description: "fireball", items: [] }]

  end

end
