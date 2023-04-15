class Piece
  attr_reader :color, :board, :col, :row, :move_history

  def initialize(board, color, col, row)
    @board = board
    @color = color
    @col = col
    @row = row
    @move_history = []
  end
end
