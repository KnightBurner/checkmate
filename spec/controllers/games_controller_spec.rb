require 'rails_helper'


RSpec.describe GamesController, type: :controller do
  
  describe "games#update action" do
    
    it "should update black_player_id to current user id" do
      current_user = FactoryBot.create(:user)
      sign_in current_user
      #arrange
      game = FactoryBot.create(:game)
      

      #assert
      patch :update, params: { id: game.id, black_player_id: { id: current_user.id } }
      expect(game.black_player_id).to eq(current_user.id)
    end
  end

end
