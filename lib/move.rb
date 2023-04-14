class Move
  attr_reader :origin, :destination, :is_command, :command

  def initialize(origin, destination, is_command = false, command = nil)
    @origin = origin
    @destination = destination
    @is_command = is_command
    @command = command
  end

  def valid?(board)
    # Get the piece at current location, if none then false
    # Ask the piece where it can move given board
    # If destination in acceptable areas, true
  end

  def command?
    is_command
  end
end
