class Pawn < Piece
  def to_s
    return '♙' if @color == :black
    return '♟︎' if @color == :white
  end
end
