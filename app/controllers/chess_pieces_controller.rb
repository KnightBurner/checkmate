class ChessPiecesController < ApplicationController


  def index
    @chesspieces = ChessPiece.all
  end

  def show
    @chess_piece = ChessPiece.find_by(id: params[:id])
    @game = @chesspiece.game
  end

  # def update
  #  @chesspiece = ChessPiece.find_by(id: params[:id])
  #   @game = @chesspiece.game
  #   @chesspiece.update_attributes(chesspiece_params)
  #   render plain: 'updated!'
  # end

  def update
    @chess_piece = Piece.find(params[:id])
    @chess_piece.move_to!([params[:position_x], params[:position_y]])
    redirect_to game_path(@chess_piece.game)
  end

  private

  def chesspiece_params
    params.require(:chesspiece).permit(:position_x, :position_y)
  end
end

 