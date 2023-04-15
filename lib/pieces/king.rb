class King < Piece
  def to_s
    return '♔' if @color == :black
    return '♚' if @color == :white
  end

  def move_range
    destinations = []
    surrounding_squares = [[col + 1, row], [col - 1, row], [col, row + 1], [col, row - 1], [col + 1, row + 1], [col - 1, row - 1], [col + 1, row - 1],
                           [col - 1, row + 1]]
    surrounding_squares.each do |sq|
      if board.piece_at(sq).nil?
        destinations.push(sq)
      elsif board.piece_at(sq).color != color
        destinations.push(sq)
      end
    end
    destinations
  end
end
