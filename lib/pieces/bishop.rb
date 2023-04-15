class Bishop < Piece
  include DiagonalMovement

  def to_s
    return '♗' if @color == :black
    return '♝' if @color == :white
  end

  def move_range
    check_upleft + check_upright + check_downleft + check_downright
  end
end
