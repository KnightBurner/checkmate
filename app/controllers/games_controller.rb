class GamesController < ApplicationController
  def show
  end

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
end


