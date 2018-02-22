#Refactored code from hero_choice.ex here to allow for reusing the code
defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def ask_for_index(options) do
    answer =
      options
      |> display_options
      |> generate_question
      |> Shell.prompt
      |> Integer.parse
    case answer do
      :error ->
        display_invalid_option()
        ask_for_index(options)
      {option, _} ->
        option - 1
    end
  end

  def display_invalid_option do
    Shell.cmd("clear")
    Shell.error("Invalid option.")
    Shell.prompt("Press enter to try again.")
    Shell.cmd("clear")
  end

  @doc "Error management using 'with' statement - Pragmatic"
  def ask_for_option(options) do
    answer =
      options
      |> display_options
      |> generate_question
      |> Shell.prompt
    with {option, _} <- Integer.parse(answer),
          chosen when chosen != nil <- Enum.at(options, option - 1) do
      chosen
    else
      :error -> retry(options)
      nil -> retry(options)
    end
  end

  def retry(options) do
    display_error("Invalid option")
    ask_for_option(options)
  end

  def display_error(message) do
    Shell.cmd("clear")
    Shell.error(message)
    Shell.prompt("Press enter to continue.")
    Shell.cmd("clear")   
  end

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

  # Replaced by 'while' block
  # def parse_answer(answer) do
  #       {option, _} = Integer.parse(answer) #Returns {Integer, Status}
  #       option - 1 #Account for index starting at 1
  #   end
end