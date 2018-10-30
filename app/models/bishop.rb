class Bishop < ChessPiece
  def display
    if color == "black"
      return "&#9821;"
    else 
      return "&#9815;"
    end
  end
end