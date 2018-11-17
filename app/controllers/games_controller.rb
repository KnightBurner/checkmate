class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @games = Game.all
  end

  def new
     @game = Game.new

   end

  def create 
    game = Game.create(game_params)
    game.update_attributes(white_player_id: current_user.id, player_turn: current_user.id)
    redirect_to game_path(game)
  end

  def show
    @game = Game.find_by(id: params[:id])

  end

  def update
    @game = Game.find_by(id: params[:id])

    if user_signed_in? && @game
      @game.update_attributes( black_player_id: current_user.id)
      redirect_to game_path(@game)
    else
      redirect_to new_user_session_path
    end

    @game.update_attributes(player_turn_params)
  end



  private

  def current_user_id
    current_user_id ||= current_user.id
  end

  def game_params
    params.permit(:black_player_id, :player_turn, :white_player_id)
  end

  def player_turn_params
    params.permit(:player_turn)
  end
end
