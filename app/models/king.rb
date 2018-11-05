class King < ChessPiece

  def display
    if color == "black"
      return "&#9818;"
    else
      return "&#9812;"
    end
  end

  def move_one_space?(stop)
    if is_vertical_move?(stop)
      (self.position_y - stop[1]).abs == 1
    elsif is_horizontal_move?(stop)
      (self.position_x - stop[0]).abs == 1
    elsif is_diagonal_move?(stop)
      (self.position_y - stop[1]).abs == 1 && (self.position_x - stop[0]).abs == 1
    else
      false
    end
  end

  def valid_move?(board, stop)
    if is_space_occupied?(board, stop)
      if is_opponent?(board, stop)
        move_one_space?(stop)
      else
        false
      end
    else
      move_one_space?(stop)
    end
  end

end