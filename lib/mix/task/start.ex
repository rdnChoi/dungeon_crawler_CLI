defmodule Mix.Tasks.Start do
    use Mix.Task #Mix Task Directive turns module into Mix task

    def run(_), do: DungeonCrawl.CLI.Main.start_game
end