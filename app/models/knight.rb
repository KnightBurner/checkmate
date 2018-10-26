class Knight < ChessPiece
  def display
    if color == "black"
      return "&#9822;"
    else
      return "&#9816;"
    end
  end

end