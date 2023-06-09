class Board
  attr_reader :board, :kings

  def initialize(board = nil)
    @kings = []
    @board = if board.nil?
               new_board
             else
               board
             end
  end

  def to_s
    str = "  a b c d e f g h\n"
    (1..8).reverse_each do |y|
      str << y.to_s
      str << ' '
      (1..8).each do |x|
        str << if piece_at([x, y]).nil?
                 '-'
               else
                 piece_at([x, y]).to_s
               end
        str << ' '
      end
      str << "\n"
    end
    str
  end

  def piece_at(location)
    @board[location]
  end

  private

  def new_board
    hash = {}
    (1..8).each do |x|
      hash[[x, 2]] = Pawn.new(self, :white, x, 2)
      hash[[x, 7]] = Pawn.new(self, :black, x, 7)
    end
    hash[[1, 1]] = Rook.new(self, :white, 1, 1)
    hash[[1, 8]] = Rook.new(self, :black, 1, 8)
    hash[[2, 1]] = Knight.new(self, :white, 2, 1)
    hash[[2, 8]] = Knight.new(self, :black, 2, 8)
    hash[[3, 1]] = Bishop.new(self, :white, 3, 1)
    hash[[3, 8]] = Bishop.new(self, :black, 3, 8)
    hash[[4, 1]] = Queen.new(self, :white, 4, 1)
    hash[[4, 8]] = Queen.new(self, :black, 4, 8)
    hash[[5, 1]] = King.new(self, :white, 5, 1)
    @kings.push(hash[[5, 1]])
    hash[[5, 8]] = King.new(self, :black, 5, 8)
    @kings.push(hash[[5, 8]])
    hash[[6, 1]] = Bishop.new(self, :white, 6, 1)
    hash[[6, 8]] = Bishop.new(self, :black, 6, 8)
    hash[[7, 1]] = Knight.new(self, :white, 7, 1)
    hash[[7, 8]] = Knight.new(self, :black, 7, 8)
    hash[[8, 1]] = Rook.new(self, :white, 8, 1)
    hash[[8, 8]] = Rook.new(self, :black, 8, 8)
    hash
  end
end
