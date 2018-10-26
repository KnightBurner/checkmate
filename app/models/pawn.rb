class Pawn < ChessPiece
  def display
    if color == "black"
      return "&#9823;"
    else
      return "&#9817;"
    end
  end
end