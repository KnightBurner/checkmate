class Pawn < ChessPiece

 

  def valid_move_two?(stop)
    (is_white? && position_y == 1 && stop[1] == 3) || 
    (is_black? && position_y == 6 && stop[1] == 4)
  end


  def is_valid_direction?(start, stop)
    (is_white? && is_moving_down?(stop)) || (is_black && is_moving_up?(stop))
  end

  def valid_move?(stop)
    if  (white_valid_move_two?(board, stop) || black_valid_move_two?(board, stop)) || (is_valid_direction?(start, stop) && spaces_between(start, stop) == 1)
      || (is_diagonal_move?(stop) && stop != nil)
      # can only move diagonally if it's capturing an opponent
    end
  end
end


