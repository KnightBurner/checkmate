require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'games#create action' do
    it 'should create a new game' do
    end
  end


  describe 'games#update action' do
    it 'should redirect to game show page' do
      game = FactoryBot.create(:game)
      patch :update, params: { id: game.id }
      expect(response).to redirect_to game_path(game)
    end
  end
end