class Pawn < ChessPiece

  def is_first_move?(board)
    (is_white? && position_y == 1)  || (is_black? && position_y == 6)
  end



  def is_white?
    color == 'white'
  end

  def is_black?
    color == 'black'
  end


  def valid_direction?(start, stop)
    if is_white? && is_moving_down?(stop) || is_black && is_moving_up?(stop)
  end



  
  def valid_move?(stop)
    if is_first_move? && is_white? && is_moving_down?(stop)
      return (position_y + 1 == stop[1]) || (position_y + 2 == stop[1])
    elsif is_first_move? && is_black? && is_moving_up?(stop)
      return (position_y - 1 == stop[1]) || (position_y - 2 == stop[1])
    elsif  !is_first_move? && !is_backwards_move?
      return position_y + 1 == stop[1]
    else 
      return is_diagonal_move?(stop) && stop != nil
    # can only move diagonally if it's capturing an opponent     
    end
  end
end


