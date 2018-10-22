require 'rails_helper'


RSpec.describe GamesController, type: :controller do
  before do
    
  end
  
  describe 'games#create action' do
    it 'should create a new game' do
    end
  end


  describe 'games#update action' do
    it 'should redirect to game show page' do
      game = FactoryBot.create(:game)
      patch :update, params: { id: game.id }
      expect(response).to redirect_to(game_path(game))
    end
  end

  # describe 'games#update action' do
    
  #   it 'should change black_player_id to current user id' do
  #     login_user
  #     game = FactoryBot.create(:game)
  #     patch :update, params: { id: game.id, black_player_id: current_user.id}
  #     expect(black_player_id).to eq(user.id)
  #   end
  # end


  # describe '#terminate' do
  #   context 'with valid args' do
  #   end

  #   context 'with invalid args' do
  #   end
  # end
end