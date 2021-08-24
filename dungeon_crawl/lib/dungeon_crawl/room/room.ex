defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers
  alias DungeonCrawl.Item

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], triggers: nil, probability: nil, type: nil, items: []


  @type t :: %Room{description: String.t, actions: List.t, triggers: List.t, probability: non_neg_integer, type: atom, items: List.t}

  def all do
    [
      %Room{
        description: "You've found a room of monsters, prepare to fight",
        actions: [forward(), ],
        triggers: [%{trigger: Triggers.Enemy, action: :forward },],
        probability: 10,
        type: "enemy",
      },
      %Room{
        description: "Behold a treasure trove",
        actions: [search()],
        triggers: [%{trigger: Triggers.Search, action: :search }],
        probability: 10,
        type: "heal",
        items: [
          %Item{name: "Healing potion",
          type: :potion,
          value: 10,
          description: "Store this potion to restore hp later"},
          %Item{name: "Fire nugget",
          type: :dragon,
          value: 10,
          description: "Good for shooting people"},
        ]
      },
      %Room{
        description: "You can see the light of day",
        actions: [forward()],
        triggers: [%{trigger: Triggers.Exit, action: :forward}],
        probability: 0,
        type: "exit"
      },
      # %Room{
      #   description: "You see an enemy blocking  your path.",
      #   actions: [ heal()],
      #   triggers: [%{trigger: Triggers.Potion, action: :heal}],
      #   probability: 8,
      #   type: "heal"
      # },

    ]
  end

end
