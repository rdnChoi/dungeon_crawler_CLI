#Refactored code from hero_choice.ex here to allow for reusing the code
defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do #Takes a list of maps
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} -> #Shorthand f(x) notation here would not allow for assign of variable
      Shell.info("#{index} - #{(option)}")
    end)

    options #Doesn't out put anything. Just passes value in pipeline! List
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options),",") #Returns String
    "Which one? [#{options}]\n"  
  end

  def parse_answer(answer) do
        {option, _} = Integer.parse(answer) #Returns {Integer, Status}
        option - 1 #Account for index starting at 1
    end
end