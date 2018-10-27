class ChessPiecesController < ApplicationController


  def index
    @chesspieces = ChessPiece.all
  end

  def show
    @chesspiece = ChessPiece.find_by(id: params[:id])
    @game = @chesspiece.game
  end

  # def update
  #   @chesspiece.update_attributes(chesspiece_params)
  #   redirect_to 
  # end


  # private

  # def chesspiece_params
  # end
end
