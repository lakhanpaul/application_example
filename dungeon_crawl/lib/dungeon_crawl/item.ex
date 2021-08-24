defmodule DungeonCrawl.Item do
  defstruct name: nil, type: nil, value: 0, description: nil

  defimpl String.Chars do
    def to_string(item) do
      item.description
    end
  end





  @type t :: %DungeonCrawl.Item{
    description: String.t,
    type: atom,
    name: String.t
  }

end
