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

   def move
    @chess_piece = Piece.find(params[:id])
    @game = Game.find(params[:game_id])
    position_x = params[:position_x]
    position_y = params[:position_y]
    @chess_piece.move_to!([params[:position_x], params[:position_y]])
    redirect_to game_path(params[:game_id])
  end

  private

  def chesspiece_params
    params.require(:chesspiece).permit(:position_x, :position_y)
  end
end

 