class Pawn < ChessPiece

 def valid_move?(board, stop)
    if  (valid_move_by_two?(stop) || (is_valid_direction?(start, stop) && spaces_between(start, stop) == 1 && !is_space_occupied(board, stop))
      || (is_diagonal_move?(stop) && is_space_occupied?(board, stop) && is_opponent(board, stop))
      # can only move diagonally if it's capturing an opponent
    end
  end

  private

  def valid_move_by_two?(stop)
    (is_white? && position_y == 1 && stop[1] == 3 && !is_space_occupied(board, stop)) || 
    (is_black? && position_y == 6 && stop[1] == 4 && !is_space_occupied(board, stop))
  end

  def is_valid_direction?(start, stop)
    (is_white? && is_moving_down?(stop)) || (is_black && is_moving_up?(stop))
  end

  def spaces_between(start, stop)
    spaces = (start...stop).to_a.drop(1)
    spaces.length
  end 
end
