class Pawn < Piece
  def to_s
    return '♙' if @color == :black
    return '♟︎' if @color == :white
  end

  def move_range
    destinations = []
    direction = 1 if @color == :white
    direction = -1 if @color == :black

    clear1 = board.piece_at([col, row + direction]).nil?
    clear2 = board.piece_at([col, row + (2 * direction)]).nil?
    destinations.push([col, row + (2 * direction)]) if move_history.empty? && clear2 && clear1
    destinations.push([col, row + direction]) if clear1

    left_diagonal = [col - 1, row + direction]
    right_diagonal = [col + 1, row + direction]
    if !board.piece_at(left_diagonal).nil? && (board.piece_at(left_diagonal).color != color)
      destinations.push(left_diagonal)
    end
    if !board.piece_at(right_diagonal).nil? && (board.piece_at(right_diagonal).color != color)
      destinations.push(right_diagonal)
    end

    destinations
  end

  def capture_range
    # Used for determining check
    direction = 1 if @color == :white
    direction = -1 if @color == :black
    [[col - 1, row + direction], [col + 1, row + direction]]
  end
end
