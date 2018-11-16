require 'rails_helper'

RSpec.describe Game, type: :model do


  describe "games.available" do
    it "should return games that have only one player" do
      game = FactoryBot.create(:game)
      games = Game.all
      expect(games.available).not_to be_nil
    end
  end

  describe "populate board all players" do
    it "determines if the populated board is complete" do
      game = FactoryBot.create(:game)
      expect(game.chess_pieces.count).to eq(32)
    end
 end

  describe "populate board with the white players" do
    it "Places all of the white player pieces onto the board's start-game positions" do
      game = FactoryBot.create(:game)
      

      # white Pawns
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 1).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 1).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 1).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 1).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 1).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 1).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 1).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 1).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 1).color).to eq 'white'
  


      # white Rooks
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 0).type).to eq 'Rook'
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 0).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 0).type).to eq 'Rook'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 0).color).to eq 'white'

 

      # white Knights
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 0).type).to eq 'Knight'
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 0).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 0).type).to eq 'Knight'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 0).color).to eq 'white'


      # white Bishops
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 0).type).to eq 'Bishop'
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 0).color).to eq 'white'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 0).type).to eq 'Bishop'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 0).color).to eq 'white'

 
      # white Queen
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 0).type).to eq 'Queen'
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 0).color).to eq 'white'

      # white King
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 0).type).to eq 'King'
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 0).color).to eq 'white'
    end
  end

  describe "populate board with the black players" do
    it "Places all of the black player pieces onto the board's start-game positions" do
      game = FactoryBot.create(:game)
      

      # black Pawns
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 6).type).to eq 'Pawn'
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 6).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 6).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 6).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 6).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 6).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 6).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 6).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 6).color).to eq 'black'
  


      # black Rooks
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 7).type).to eq 'Rook'
      expect(game.chess_pieces.find_by(position_x: 0, position_y: 7).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 7).type).to eq 'Rook'
      expect(game.chess_pieces.find_by(position_x: 7, position_y: 7).color).to eq 'black'

 

      # black Knights
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 7).type).to eq 'Knight'
      expect(game.chess_pieces.find_by(position_x: 1, position_y: 7).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 7).type).to eq 'Knight'
      expect(game.chess_pieces.find_by(position_x: 6, position_y: 7).color).to eq 'black'


      # black Bishops
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 7).type).to eq 'Bishop'
      expect(game.chess_pieces.find_by(position_x: 2, position_y: 7).color).to eq 'black'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 7).type).to eq 'Bishop'
      expect(game.chess_pieces.find_by(position_x: 5, position_y: 7).color).to eq 'black'

 
      # black Queen
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 7).type).to eq 'Queen'
      expect(game.chess_pieces.find_by(position_x: 3, position_y: 7).color).to eq 'black'

      # black King
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 7).type).to eq 'King'
      expect(game.chess_pieces.find_by(position_x: 4, position_y: 7).color).to eq 'black'
    end
  end
  
  
  
  describe "check" do
    it "should return true if the game is in check"
      game = FactoryBot.create(:game)
      game.pieces.destroy_all
      King.create(position_x: 0, position_y: 7, color: black, game_id: game.id)
      King.create(position_x: 0, position_y: 5, color: white, game_id: game.id)
      Rook.create(position_x: 2, position_y: 7, color: white, game_id: game.id)
      expect(game.check?).to eq true
    end
    it "should return false if the game is not in check"
      game = FactoryBot.create(:game)
      expect(game.check?).to eq false
    end
 

  
  



