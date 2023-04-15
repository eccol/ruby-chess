class Piece
  attr_reader :color, :board, :col, :row
  attr_accessor :move_history

  def initialize(board, color, col, row)
    @board = board
    @color = color
    @col = col
    @row = row
    @move_history = []
  end

  def update_position
    @col = move_history.last.destination[0]
    @row = move_history.last.destination[1]
  end
end
