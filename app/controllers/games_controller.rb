class GamesController < ApplicationController

  def index
    @games = Game.first  
  end

  def new
    @game = Game.new
  end

  def create 
  end

  def show
  end
end

