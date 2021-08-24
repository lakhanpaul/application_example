defmodule DungeonCrawl.Enemies do
  alias DungeonCrawl.Character


  def all do
    [
      %Character{
        name: "Ogre",
        description: "Annoying big, green thingy, basically Shrek",
        hit_points: 15,
        max_hit_points: 15,
        damage_range: 3..5,
        attack_description: "Whacks you with his club",
      },
      %Character{
        name: "Orc",
        description: "An evil, ghoulish creature, who looks like a medieval emu",
        hit_points: 8,
        max_hit_points: 8,
        damage_range: 2..4,
        attack_description: "Hits you with his axe",
      },
      %Character{
        name: "Goblin",
        description: "Tiny green elf thing, but not nice like a smurf, its annoying",
        hit_points: 4,
        max_hit_points: 4,
        damage_range: 1..2,
        attack_description: "A tiny dagger",
      },
    ]
  end

end
