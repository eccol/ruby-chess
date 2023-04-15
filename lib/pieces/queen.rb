class Queen < Piece
  include StraightMovement
  include DiagonalMovement

  def to_s
    return '♕' if @color == :black
    return '♛' if @color == :white
  end

  def move_range
    check_left + check_right + check_up + check_down + check_upleft + check_upright + check_downleft + check_downright
  end
end
