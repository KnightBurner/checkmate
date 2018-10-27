class Rook < ChessPiece
  def display
    if color == "black"
      return "&#9820;"
    else
      return "&#9814;"
  end
   
  def valid_move?(board, stop)
    self.is_vertical_move?(board, stop) || self.is_horizontal_move?(board, stop)
  end
end
end
