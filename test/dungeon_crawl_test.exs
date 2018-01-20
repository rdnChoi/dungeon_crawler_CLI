defmodule DungeonCrawlTest do
  use ExUnit.Case #Adds ability to run tests and utility functions for this module
  doctest DungeonCrawl #Comes from ExUnit.Case. Parses module documentation and runs code checking if it works. 

  #Test code below
  test "greets the world" do
    assert DungeonCrawl.hello() == :world
  end
end
