defmodule DungeonCrawl.Character do
  defstruct name: nil, description: nil, hit_points: 0, max_hit_points: 0, attack_description: nil, damage_range: nil, score: 0, items: nil

  defimpl String.Chars do
    def to_string(character) do
      character.name
    end
  end

  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %{character | hit_points: new_hit_points}
  end

  def heal(character, healing_value) do
    new_hit_points = min(character.hit_points + healing_value, character.max_hit_points)

    %{character | hit_points: new_hit_points}
  end

  def increase_score(character, score_increase) do
    new_score = character.score + score_increase
    %{character | score: new_score}
  end

  def pick_up(character, item) do
    new_items = [character.items | item]
    %{character | items: new_items }
  end

  def use_item(character, item) do
    character_items = character.items
    new_items = Enum.filter(character_items, fn x -> x.id  != item.id end )
    %{character | items: new_items}
  end



  def current_stats(character) do
    "Player status n\HP:  #{character.hit_points}/#{character.max_hit_points}"
  end

  @type t :: %DungeonCrawl.Character{
    name: String.t,
    description: String.t,
    hit_points: non_neg_integer,
    max_hit_points: non_neg_integer,
    attack_description: String.t,
    damage_range: Range.t,
    score: non_neg_integer,
    items: List.t
  }

end
