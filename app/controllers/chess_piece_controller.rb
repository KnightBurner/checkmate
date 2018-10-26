class ChessPieceController < ApplicationController

  def show
    @game = Game.find(params[:id]) 
    @chess_piece = ChessPiece.find(params[:id])
    
  end


  def update
    @chesspiece.update_attributes(position_x, position_y)
    redirect_to chesspiece_path(@chesspiece)
  end



end
