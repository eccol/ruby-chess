class Pawn < Piece
  def to_s
    '♙' if @color == :black
    '♟︎' if @color == :white
  end
end
