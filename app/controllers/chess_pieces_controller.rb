class ChessPiecesController < ApplicationController


  def index
    @chesspieces = ChessPiece.all
  end

  def show
    @chesspiece = ChessPiece.find_by(id: params[:id])
    @game = @chesspiece.game
  end

  def update
    @chesspiece = ChessPiece.find_by(id: params[:id])
    @game = @chesspiece.game
    @chesspiece.update_attributes(chesspiece_params)
    render plain: 'updated!'
  end

  def edit
    @chesspiece = ChessPiece.find_by(id: params[:id])
  end

  private

  def chesspiece_params
    params.require(:chesspiece).permit(:position_x, :position_y)
  end
end
