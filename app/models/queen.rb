class Queen < ChessPiece

  def valid_move?(board, stop)
    if is_space_occupied?(board, stop)
      if is_opponent(board, stop)
        return !is_obstructed?(start, stop)
      end
    else
      return !is_obstructed?(start, stop)
    end
  end

end