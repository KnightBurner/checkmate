class StaticPagesController < ApplicationController
  def index
    @games  = Game.all
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)
    redirect_to game_path(game)
  end

end
