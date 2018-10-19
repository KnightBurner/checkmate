class ChessPieceController < ApplicationController

  def show
    @game = Game.find(params[:id]) 
    @chess_piece = ChessPiece.find(params[:id])
    
  end

  def update
  end


end
