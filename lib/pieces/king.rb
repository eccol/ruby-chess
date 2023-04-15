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
        destinations.push(sq) unless check_check(sq)
      elsif board.piece_at(sq).color != color
        destinations.push(sq) unless check_check(sq)
      end
    end
    destinations
  end

  private

  def check_check(sq)
    board.board.each do |_, piece|
      next if piece.is_a?(King)

      if piece.is_a?(Pawn)
        return true if piece.capture_range.include?(sq) && piece.color != color
      elsif piece.move_range.include?(sq) && piece.color != color
        return true
      end
    end
    false
  end
end
