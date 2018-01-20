defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action

  #Callback is a function rule. Consistent Code.
  #Trigger.run ONLY takes the typespec data we defined in Character and Action Structs
  @callback run(Character.t, Action.t) :: {Character.t, atom}
end