module StraightMovement
  def check_up
    destinations = []
    (col + 1..8).each do |x|
      unless board.piece_at([x, row]).nil?
        destinations.push([x, row]) if board.piece_at([x, row]).color != color
        break
      end
      destinations.push([x, row])
    end
    destinations
  end

  def check_down
    destinations = []
    (col - 1).downto(1).each do |x|
      unless board.piece_at([x, row]).nil?
        destinations.push([x, row]) if board.piece_at([x, row]).color != color
        break
      end
      destinations.push([x, row])
    end
    destinations
  end

  def check_left
    destinations = []
    (row + 1..8).each do |y|
      unless board.piece_at([col, y]).nil?
        destinations.push([col, y]) if board.piece_at([col, y]).color != color
        break
      end
      destinations.push([col, y])
    end
    destinations
  end

  def check_right
    destinations = []
    (row - 1).downto(1).each do |y|
      unless board.piece_at([col, y]).nil?
        destinations.push([col, y]) if board.piece_at([col, y]).color != color
        break
      end
      destinations.push([col, y])
    end
    destinations
  end
end

module DiagonalMovement
  def check_downright
    destinations = []
    (col + 1..8).each_with_index do |x, i|
      unless board.piece_at([x, row - i - 1]).nil?
        destinations.push([x, row - i - 1]) if board.piece_at([x, row - i - 1]).color != color
        break
      end
      destinations.push([x, row - i - 1])
    end
    destinations
  end

  def check_upright
    destinations = []
    (col + 1..8).each_with_index do |x, i|
      unless board.piece_at([x, row + i + 1]).nil?
        destinations.push([x, row + i + 1]) if board.piece_at([x, row + i + 1]).color != color
        break
      end
      destinations.push([x, row + i + 1])
    end
    destinations
  end

  def check_upleft
    destinations = []
    (row + 1..8).each_with_index do |y, i|
      unless board.piece_at([col - i - 1, y]).nil?
        destinations.push([col - i - 1, y]) if board.piece_at([col - i - 1, y]).color != color
        break
      end
      destinations.push([col - i - 1, y])
    end
    destinations
  end

  def check_downleft
    destinations = []
    (row - 1).downto(1).each_with_index do |y, i|
      unless board.piece_at([col - i - 1, y]).nil?
        destinations.push([col - i - 1, y]) if board.piece_at([col - i - 1, y]).color != color
        break
      end
      destinations.push([col - i - 1, y])
    end
    destinations
  end
end
