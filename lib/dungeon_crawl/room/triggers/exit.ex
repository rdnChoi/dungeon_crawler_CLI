defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger

  #This trigger returns an :exit flag
  def run(character, _), do: {character, :exit}

end