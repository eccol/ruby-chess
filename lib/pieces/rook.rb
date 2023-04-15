class Rook < Piece
  include StraightMovement

  def to_s
    return '♖' if @color == :black
    return '♜' if @color == :white
  end

  def move_range
    check_up + check_down + check_left + check_right
  end
end
