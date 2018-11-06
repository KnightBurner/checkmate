class Knight < ChessPiece

  def display
    if color == "black"
      return "&#9822;"
    else
      return "&#9816;"
    end
  end

  def is_valid_move?(board, stop)
    (is_horizontal_move?(board, stop) || is_vertical_move?(board, stop)) && (is_space_occupied?(board, stop) && (is_opponent?(board, stop))
  end

  private

  # moves 2 spaces horizontally and 1 space vertically
  def is_horizontal_move?(board, stop)
    (position_x - stop[0]).abs == 2 && (position_y - stop[1]).abs == 1
  end

  # moves 2 spaces vertically and 1 space horizontally
  def is_vertical_move?(board, stop)
    (position_y - stop[1]).abs == 2 && (position_x - stop[0]).abs == 1
  end  
end