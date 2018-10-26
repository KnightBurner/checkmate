class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create 
    @game = Game.create(game_params)

  end

  def show

  end

  def update
    @game = Game.find_by(id: params[:id])

    if user_signed_in? && @game
      @game.update_attributes( black_player_id: current_user.id)
      redirect_to game_path(@game)
    else 
      redirect_to new_user_session_path, :alert => "Please sign in"
    end
  end

  private

  def game_params
    params.require(:game).permit(:black_player_id, :player_turn, :white_player_id)
  end
end
