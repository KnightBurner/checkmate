class Rook < ChessPiece
  def display
    if color == "black"
      return "&#9820;"
    else
      return "&#9814;"
    end
   end
  
  
  def valid_move?(board, stop)
    if self.is_vertical_move?(board,stop)
      return true
    elsif self.is_horizontal_move?(board, stop)
      return true
    end
  end

    
 
end