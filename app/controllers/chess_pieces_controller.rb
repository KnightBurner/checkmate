class ChessPiecesController < ApplicationController


  def index
    @chesspieces = ChessPiece.all
  end

  def show
    @chesspiece = ChessPiece.find_by(id: params[:id])
    @game = @chesspiece.game
  end

  def update
    @chess_piece = ChessPiece.find(params[:id])
    @chess_piece.move_to!([params[:position_x], params[:position_y]])
    if @chess_piece.check?
      flash[:error] = "You are in check!"
    end
    redirect_to game_path(@chess_piece.game)
  end

  private

  def chesspiece_params
    params.require(:chesspiece).permit(:position_x, :position_y)
  end
end

 
