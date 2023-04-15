class Move
  attr_reader :origin, :destination, :is_command, :command

  def initialize(origin = nil, destination = nil, is_command = false, command = nil)
    @origin = unpack(origin) unless origin.nil?
    @destination = unpack(destination) unless destination.nil?
    @is_command = is_command
    @command = command
  end

  def valid?(board)
    piece = board.piece_at(origin)
    return false if piece.nil?

    possible_destinations = piece.move_range
    possible_destinations.include? destination
  end

  def command?
    is_command
  end

  private

  def unpack(square)
    return square if square.is_a?(Array)

    col = square[0].downcase
    row = square[1].to_i
    col = ('a'..'h').to_a.index(col) + 1
    [col, row]
  end
end
