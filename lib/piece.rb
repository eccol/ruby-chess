class Piece
  attr_reader :color, :board, :col, :row

  def initialize(board, color, col, row)
    @board = board
    @color = color
    @col = col
    @row = row
  end
end
