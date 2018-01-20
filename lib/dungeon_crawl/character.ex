defmodule DungeonCrawl.Character do
    #Structs - ELements that cannot be changed in our application. Foundational type structures.
    defstruct   name: nil,
                description: nil,
                hit_points: 0,
                max_hit_points: 0,
                attack_description: nil,
                damage_range: nil

  #@type defines the typespec for each struct attribute
  @type t :: %DungeonCrawl.Character{
    name: String.t,
    description: String.t,
    hit_points: non_neg_integer,
    max_hit_points: non_neg_integer,
    attack_description: String.t,
    damage_range: Range.t
  }

  defimpl String.Chars do #String.Chars Kernel Protocol - converts structure to binary
      def to_string(character), do: character.name
  end

  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage) #can't have less than 0 hp
    %{character | hit_points: new_hit_points} #Easy way to update struct values
  end

  def heal(character, healing_value) do
    new_hit_points = min(
    character.hit_points + healing_value,
    character.max_hit_points
    )
    %{character | hit_points: new_hit_points}
  end

  def current_stats(character),
    do: "Player Stats\nHP #{character.hit_points}/#{character.max_hit_points}"

  end
