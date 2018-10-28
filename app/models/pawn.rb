class Pawn < ChessPiece

  def is_first_move?
    (color == 'white' && position_y == 1)  || (color == 'black' && position_y == 6)
  end

  def is_backwards_move?
    if (color == 'white' && is_moving_up?(stop)) || (color == 'black' && is_moving_down?(stop))
  end

  def valid_move?(stop)
    if is_first_move? && color == 'white'
      return (position_y + 1 == stop[1]) || (position_y + 2 == stop[1])
    elsif is_first_move? && color == 'black'
      return (position_y - 1 == stop[1]) || (position_y - 2 == stop[1])
    elsif  !is_first_move? && !is_backwards_move?
      return position_y + 1 == stop[1]
    else is_diagonal_move(stop) && 
    # can only move diagonally if it's capturing an opponent
      
    end
  end
end
