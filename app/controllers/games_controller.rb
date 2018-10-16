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
    @game = Game.create  
  end

  def show
    @game = Game.show
  end
end
