class Queen < ChessPiece
  def display
    if color == "black"
      return "&#9819;"
    else
      return "&#9813;"
    end
  end

  def valid_move?(board, stop)
    if is_space_occupied?(board, stop)
      if is_opponent?(board, stop)
        !is_obstructed?(board, stop)
      else
        false
      end
    else
      !is_obstructed?(board, stop)
    end
  end
end