defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("clear") #cmd/1 - Sends terminal commands
    Shell.info("Start by choosing your hero:") #info/1 - Ouputs text to terminal

    heros = DungeonCrawl.Heros.all() #Assigning all heros to variable hero
    find_hero_by_index = &Enum.at(heros, &1) #Assigns index to each hero. THIS IS A FUNCTION. Returns value of STRUCT at index.

    heros
    |> display_options #BaseCommand
    |> generate_question #BaseCommand
    |> Shell.prompt
    |> parse_answer #BaseCommand
    |> find_hero_by_index.()
    |> confirm_hero
  end

  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end
end

