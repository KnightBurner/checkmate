class Knight < ChessPiece

  def display
    if color == "black"
      return "&#9822;"
    else
      return "&#9816;"
    end
  end


  def is_obstructed?
      nil
  end


  def up_two_right?(board, stop)
    # moves up 2 right 1
      (is_moving_up(stop) && spaces_between(self.position_y, stop[1]) == 2)
        && (is_moving_right(stop) && spaces_between (self.position_x, stop[0]) == 1)
  end

  def up_two_left?(board, stop)
    # moves up 2 left 1
    (is_moving_up(stop) && (spaces_between(self.position_y, stop[1]) == 2)
      && (is_moving_left(stop) && spaces_between(self.position_x, stop[0]) == 1)
  end

  def down_two_right?(board, stop)
    # moves down 2 right 1
    (is_moving_down(stop) && (spaces_between(self.position_y, stop[1]) == 2)
      && (is_moving_right(stop) && spaces_between(self.position_x, stop[0]) == 1)
  end

  def down_two_left?(board, stop)
    # moves down 2 left 1
    (is_moving_down(stop) && (spaces_between(self.position_y, stop[1]) == 2)
      && (is_moving_left(stop) && spaces_between(self.position_x, stop[0]) == 1)
  end

  def up_one_right?(board, stop)
    # moves up 1 right 2
      (is_moving_up(stop) && spaces_between(self.position_y, stop[1]) == 1)
        && (is_moving_right(stop) && spaces_between (self.position_x, stop[1]) == 2)
  end

  def up_one_left?(board, stop)
    # moves up 1 left 2
    (is_moving_up(stop) && (spaces_between(self.position_y, stop[1]) == 1)
      && (is_moving_left(stop) && spaces_between(self.position_x, stop[0]) == 2)
  end

  def down_one_right?(board, stop)
    # moves down 1 right 2
    (is_moving_down(stop) && (spaces_between(self.position_y, stop[1]) == 1)
      && (is_moving_right(stop) && spaces_between(self.position_x, stop[0]) == 2)
  end

  def down_one_left?(board, stop)
    # moves down 1 left 2
    (is_moving_down(stop) && (spaces_between(self.position_y, stop[1]) == 1)
      && (is_moving_left(stop) && spaces_between(self.position_x, stop[0]) == 2)
  end

  def is_valid_move?(board, stop)
    if up_two_right?(board, stop) || up_two_left?(board, stop)  || down_two_right?(board, stop) || down_two_left(board, stop)
      || up_one_right?(board, stop) || up_one_left?(board, stop) || down_one_right?(board, stop) || down_one_left?(board, stop)
    end
  end
end