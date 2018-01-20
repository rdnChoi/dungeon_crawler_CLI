defmodule DungeonCrawl.Room.Triggers.Rest do
  alias Mix.Shell.IO, as: Shell
  @behaviour DungeonCrawl.Room.Trigger

  def run(character, %DungeonCrawl.Room.Action{id: :rest}) do
    heal_amount = Enum.random(2..5)
    updated_character = DungeonCrawl.Character.heal(character, heal_amount)
    Shell.info("You healed for #{heal_amount}.")
    Shell.info(DungeonCrawl.Character.current_stats(updated_character))

    {character, :forward}
  end

end