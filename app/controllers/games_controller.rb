class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

#   def new
#     @game = Game.new
#   end

  def create 
    @game = Game.create  
  end

  def show

  end

  def update
    @game = Game.find_by(id: params[:id])

    if @game
      @game.update_attributes( black_player_id: current_user.id)
      redirect_to game_path(@game)
    else 
      # some code to handle failure case
    end
  end

  private

  def game_params
    params.require(:game).permit(:black_player_id, :player_turn, :white_player_id)
  end
end
