require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
  describe 'chess_pieces#show action' do
    game = FactoryBot.create(:game)

    it 'should successfully show page' do
      get :show, params: { id: game.piece_at(0,0).id }
      expect(response).to have_http_status(:success)
    end
  end

end
