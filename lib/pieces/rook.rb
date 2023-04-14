class Rook < Piece
  def move_range
    destinations = []
    # All spaces up down left and right until blocked
    (col + 1..8).each do |x|
      unless board.piece_at([x, row]).nil?
        destinations.push([x, row])
        break
      end
      destinations.push([x, row])
    end
    (1..col - 1).each do |x|
      unless board.piece_at([x, row]).nil?
        destinations.push([x, row])
        break
      end
      destinations.push([x, row])
    end
    (row + 1..8).each do |y|
      unless board.piece_at([col, y]).nil?
        destinations.push([col, y])
        break
      end
      destinations.push([col, y])
    end
    (1..row - 1).each do |y|
      unless board.piece_at([col, y]).nil?
        destinations.push([col, y])
        break
      end
      destinations.push([col, y])
    end
    destinations
  end
end
