class Queen < ChessPiece
  def display
    if color == "black"
      return "&#9819;"
    else
      return "&#9813;"
    end
  end
end