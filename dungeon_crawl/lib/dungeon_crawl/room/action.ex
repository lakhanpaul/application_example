defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action
  defstruct label: nil, id: nil

  @type t :: %Action{id: atom, label: String.t}

  def forward do
    %Action{id: :forward, label: "Move forward"}
  end

  def rest do
    %Action{id: :rest, label: "Shut up and rest"}
  end

  def search do
    %Action{id: :search, label: "Do some searching"}
  end

  def heal do
    %Action{id: :heal, label: "Drink this healing potion"}
  end


  defimpl String.Chars do
    def to_string(action) do
      action.label
    end
  end

end
