class Knight < Piece
  def to_s
    return '♘' if @color == :black
    return '♞' if @color == :white
  end

  def move_range
    destinations = []
    possibilities = [[col + 1, row + 2], [col - 1, row + 2], [col + 1, row - 2], [col - 1, row - 2], [col + 2, row + 1], [col + 2, row - 1],
                     [col - 2, row + 1], [col - 2, row - 1]]
    possibilities.each do |sq|
      if board.piece_at(sq).nil?
        destinations.push(sq)
      elsif board.piece_at(sq).color != color
        destinations.push(sq)
      end
    end
  end
end
