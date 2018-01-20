#Room Struct
defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  # #Importing Action Struct as they are used in Room Struct Definition
  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil, chance: nil # normal_chance: nil, hard_chance: nil
  
  def all do
    [
    %Room{
      description: "You can see an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy,
      chance: 1..30
      # normal_chance: 1..30, #30%
      # hard_chance: 1..35 #35%
    },
    %Room{
      description: "You found a quiet place. Looks safe for a little nap.",
      actions: [forward(), rest()],
      trigger: Triggers.Rest,
      chance: 31..50
      # normal_chance: 31..50, #20%
      # hard_chance: 36..50 #15%
    },
    %Room{
      description: "You can see the light of day. You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit,
      chance: 51..60
      # normal_chance: 1..20, #20%
      # hard_chance: 51..65 #15%
    },
    %Room{
      description: "The flickering of a campfire is seen but wait... There is no one around. `Tip-toeing closer you notice some rustling behind you. SMASH! An enemy jumps down from a tree and ambushes you!",
      actions: [forward()],
      trigger: Triggers.Enemy,
      chance: 61..100
      # normal_chance: 1..30, #30%
      # hard_chance: 66..100 #35%
    },
  ]
  end
end