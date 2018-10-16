class King < ChessPiece

  def move_one_space?(start, stop)
    (start - stop).abs = 1
  end

  def valid_move?(board, stop)
    if self.is_vertical_move?(board, stop)
      return move_one_space?(self.position_y, stop.position_y)
    elsif self.is_horizontal_move?(board, stop)
      return move_one_space?(self.position_x, stop.position_x)
    else self.is_diagonal_move?(board, stop)
      return move_one_space?(self.position_y, stop.position_y) && move_one_space?(self.position_x, stop.position_x)
    end
  end
end