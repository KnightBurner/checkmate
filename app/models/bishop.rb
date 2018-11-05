class Bishop < ChessPiece
  def display
    if color == "black"
      return "&#9821;"
    else 
      return "&#9815;"
    end
  end

  def valid_move?(board, stop)
    if is_diagonal_move?(stop)
      if is_space_occupied?(board, stop)
        if is_opponent?(board, stop)
          !is_obstructed?(board, stop)
        else
          false
        end
      else
        !is_obstructed?(board, stop)
      end
    else
      false
    end
  end
end