class King < ChessPiece
  def display
    if color == "black"
      return "&#9818;"
    else
      return "&#9812;"
  end
end
  def move_one_space?(start, stop)
    (start - stop).abs = 1
  end
  def valid_move?(board, stop)
    if is_space_occupied?(board, stop)
      if is_opponent(board, stop)
        return move_one_space?(start, stop)
      end
    else
      return move_one_space(start, stop)
    end
  end
end