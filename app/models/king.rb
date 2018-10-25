class King < ChessPiece
  
  def display
    if color == "black"
      return "&#9818;"
    else
      return "&#9812;"
    end
  end
  
end
