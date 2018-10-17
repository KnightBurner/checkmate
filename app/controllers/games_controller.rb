class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create 
  end

  def show
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes( black_player_id: current_user.id  )
    redirect_to game_path(@game)
  end

end

