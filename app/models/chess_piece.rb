class ChessPiece < ApplicationRecord

# CHECKS WHICH DIRECTION
  def is_vertical_move?(stop)
    self.position_x == stop.position_x
  end

  def is_horizontal_move?(stop)
    self.position_y == stop.position_y
  end

  def is_diagonal_move?(stop)
    (self.position_x - stop.position_x).abs == (self.position_y - stop.position_y).abs
  end

# CHECKS WHICH VERTICAL MOVMENT
  def is_moving_up?(stop)
    self.position_y - stop.position_y < 0
  end

  def is_moving_down?(stop)
    self.position_y - stop.position_y > 0
  end

# CHECKS WHICH HORIZONTAL MOVEMENT
  def is_moving_left?(stop)
    self.position_x - stop.position_x > 0
  end

  def is_moving_right?(stop)
    self.position_x - stop.position_x < 0
  end

# CHECKS WHICH DIAGONAL MOVEMENT
  def is_moving_up_right?(stop)
    is_moving_right?(stop) && is_moving_up?(stop)
  end

  def is_moving_up_left?(stop)
    is_moving_up?(stop) && is_moving_left?(stop)
  end

  def is_moving_down_right?(stop)
    is_moving_down?(stop) && is_moving_right?(stop)
  end

  def is_moving_down_left?(stop)
    is_moving_down?(stop) && is_moving_left(stop)
  end

# CREATES AN ARRAY OF THE SPACES IN BETWEEN THE MOVEMENT
  def spaces_between(start, stop)
    (start...stop).to_a.drop(1)
  end

# DETECTS OBSTRUCTION BASED ON THE MOVE DIRECTION
  def detect_vertical_up_obstruction(board, stop)
    spaces_between(self.position_y, stop.position_y).find do |position_y|
      board[position_y][self.position_x] != nil
    end
  end

  def detect_vertical_down_obstruction(board, stop)
    spaces_between(stop.position_y, self.position_y).find do |position_y|
      board[position_y][self.position_x] != nil
    end
  end

  def detect_horizontal_left_obstruction(board, stop)
    spaces_between(stop.position_x, self.position_x).find do |position_x|
      board[self.position_y][position_x] != nil
    end
  end

  def detect_horizontal_right_obstruction(board, stop)
    spaces_between(self.position_x, stop.position_x).find do |position_x|
      board[self.position_y][position_x] != nil
    end
  end

  def detect_diagonal_up_right_obstruction(board, stop)
    x = spaces_between(self.position_x, stop.position_x)
    y = spaces_between(self.position_y, stop.position_y)
    y.find do |position_y|
      board[position_y][x[y.find_index(position_y)]] != nil
    end
  end

  def detect_diagonal_up_left_obstruction(board, stop)
    x = spaces_between(stop.position_x, self.position_y)
    y = spaces_between(self.position_y, stop.position_y)
    y.find do |position_y|
      board[position_y][x[y.find_index(position_y)]] != nil
    end
  end

  def detect_diagonal_down_right_obstruction(board, stop)
    x = spaces_between(self.position_x, stop.position_x)
    y = spaces_between(stop.position_y, self.position_y)
    y.find do |position_y|
      board[position_y][x[y.find_index(position_y)]] != nil
    end
  end

  def detect_diagonal_down_left_obstruction(board, stop)
    x = spaces_between(stop.position_x, self.position_x)
    y = spaces_between(stop.position_y, self.position_y)
    y.find do |position_y|
      board[position_y][x[y.find_index(position_y)]]
    end
  end

  def is_vertically_obstructed?(board, stop)
    if is_vertical_move?(stop)
      if is_moving_up?(stop)
        return detect_vertical_up_obstruction(board, stop)
      else
        return detect_vertical_down_obstruction(board, stop)
      end
    end
  end

  def is_horizontally_obstructed?(board, stop)
    if is_horizontal_move?(stop)
      if is_moving_left?(stop)
        return detect_horizontal_left_obstruction(board, stop)
      else
        return detect_horizontal_right_obstruction(board, stop)
      end
    end
  end

  def is_diagonally_obstructed?(board, stop)
    if is_diagonal_move?(stop)
      if is_moving_up_right?(stop)
        return detect_diagonal_up_right_obstruction(board, stop)
      elsif is_moving_up_left?(stop)
        return detect_diagonal_up_left_obstruction(board, stop)
      elsif is_moving_down_right?(stop)
        return detect_diagonal_down_right_obstruction(board, stop)
      else
        return detect_diagonal_down_left_obstruction(board, stop)
      end
    end
  end

  def is_obstructed?(board, stop)
    return is_vertically_obstructed?(board, stop) || is_horizontally_obstructed?(board, stop) || is_diagonally_obstructed?(board, stop)
  end

end
