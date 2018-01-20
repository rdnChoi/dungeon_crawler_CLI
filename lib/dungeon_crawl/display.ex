defprotocol DungeonCrawl.Display do
  def info(value)
end

defimpl DungeonCrawl.Display, for: DungeonCrawl.Room.Action  do
  def info(action), do: action.label
end

defimpl DungeonCrawl.Display, for: DungeonCrawl.Character do
  def info(character), do: character.name
end

#Organizing Protocols:
#-For custom Protocols Keep implementations inside of protocol file
#-For implementing existing protocols from other libraries, put the implementation inside of the data type module
#-Implementing outside protocol of outside data types, keep implementations in one centralized file