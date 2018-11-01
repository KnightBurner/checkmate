class Pawn < ChessPiece

  def is_white?
    color == 'white'
  end

  def is_black?
    color == 'black'
  end

  def is_first_move_white?(board)
    is_white? && position_y == 1
  end

  def is_first_move_black?(board)
    is_black? && position_y == 6
  end


  def white_valid_move_two?(board, stop)
    is_first_move_white?(board) && (position_y + 2 == stop[1])
  end

  def black_valid_move_two?(board, stop)
    is_first_move_black?(board) && (position_y - 2 == stop[1])
  end


  def is_valid_direction?(start, stop)
    (if is_white? && is_moving_down?(stop)) || (is_black && is_moving_up?(stop))
  end

  def valid_move?(stop)
    if  (white_valid_move_two?(board, stop) || black_valid_move_two?(board, stop)) || (is_valid_direction?(start, stop) && spaces_between(start, stop) == 1)
      || (is_diagonal_move?(stop) && stop != nil)
      # can only move diagonally if it's capturing an opponent
    end
  end
end


