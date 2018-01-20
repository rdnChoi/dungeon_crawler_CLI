defmodule Sandbox do
    alias Mix.Shell.IO, as: Shell

    def test do
    Shell.prompt("type")
    end

  # defstruct description: nil, chance: nil #Defines the struct. Call using the MODULE name**

  # def all, do: [
  #   %Sandbox{
  #     description: "You can see an enemy blocking your path.",
  #     chance: 1..40
  #   },
  #   %Sandbox{
  #     description: "You can see the light of day. You found the exit!",
  #     chance: 41..60
  #   },
  #   %Sandbox{
  #     description: "The flickering of a campfire is seen but wait... There is no one around.\n
  #     Tip-toeing closer you notice some rustling behind you. SMASH! An enemy jumps down from a tree and ambushes you!",
  #     chance: 61..100
  #   },
  # ]

  # def sandbox_selector do
  #   winning_number = Enum.random(1..100)
  #   Enum.find(all(), fn %{chance: chance} -> winning_number in chance end)
  # end

# def function do
#     list = IO.gets ("Enter a list: ")
#     list
#     |> String.trim
#     |> String.split
#     |> Enum.map(&String.to_integer/1)
#   end

  end
