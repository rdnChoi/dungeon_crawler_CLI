#Module will control our entire game
defmodule DungeonCrawl.CLI.Main do
    alias Mix.Shell.IO, as: Shell #Allows interaction with the terminal

    @doc "Starting function - KEEP THIS CLEAN"
    def start_game do
        Shell.cmd("clear")
        welcome_message()
        Shell.prompt("\nPress enter to continue") #prompt/1 - Prompts user

        crawl(hero_choice(), DungeonCrawl.Room.all()) #Elixir invokes the argument functions before the actual function. That is why hero_choice() is called first
    end

    # defp difficulty_selector do
    #   Shell.infO("Please select a difficulty (Normal/Hard)")
    #   difficulty = Shell.prompt("")
    #   |> String.trim
    # end 

    defp welcome_message do
        Shell.info("== Dungeon Crawl ==")
        Shell.info("You awake in a dungeon full of monsters.")
        Shell.info("You need to survive and find the exit.")
    end

    defp crawl(%{hit_points: 0}, _) do
      Shell.prompt("")
      Shell.cmd("clear")
      Shell.info("Unfortunately you wounds are too many to keep walking.")
      Shell.info("You fall onto the floor without strength to carry on.")
      Shell.info("Game over!")
      Shell.prompt("")
    end

    defp crawl(character, rooms) do
      Shell.info("You keep moving forward to the next room.")
      Shell.prompt("Press enter to continue")
      Shell.cmd("clear")

      Shell.info(DungeonCrawl.Character.current_stats(character))
      #Update players current stats before action

      rooms
      |> room_selector
      |> DungeonCrawl.CLI.RoomActionsChoice.start()
      |> trigger_action(character)
      |> handle_action_result
    end

    @doc "Generates a number 1..100 to select a room"
    defp room_selector(rooms) do
      random_number = Enum.random(1..100)
      Enum.find(rooms, fn %{normal_chance: chance} -> random_number in chance end)
    end

    defp hero_choice do
        hero = DungeonCrawl.CLI.HeroChoice.start()
        %{hero | name: "You"} #Updated character name to "You"
    end

    defp trigger_action({room, action}, character) do
      Shell.cmd("clear")
      room.trigger.run(character, action) #Triggers 
    end

    defp handle_action_result({_, :exit}),
      do: Shell.info("You found the exit. You won the game. Congratulations!")
    defp handle_action_result({character, :forward}),
      do: crawl(character, DungeonCrawl.Room.all())
end
