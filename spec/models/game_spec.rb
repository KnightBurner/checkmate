require 'rails_helper'

RSpec.describe Game, type: :model do
  
  describe "games.available" do
    it "should return games that have only one player" do
      game = FactoryBot.create(:game)
      game = FactoryBot.create(:game)
      games = Game.all
      expect(games.available).not_to be_nil
    end
  end


end
