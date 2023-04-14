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
    piece = board.piece_at(origin)
    # Ask the piece where it can move given board
    possible_destinations = piece.move_range
    # If destination in acceptable areas, true
    possible_destinations.include? destination
  end

  def command?
    is_command
  end
end
