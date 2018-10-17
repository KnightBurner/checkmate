class GamesController < ApplicationController

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
    @game = Game.find(params[:id])
    redirect_to game_path(@game)
  end

end