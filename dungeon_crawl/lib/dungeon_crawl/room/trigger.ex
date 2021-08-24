defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Room


  @callback run(Character.t, {Room.t ,Action.t}) ::{Character.t, atom}
end
