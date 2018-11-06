require 'rails_helper'

RSpec.describe Bishop, type: :model do

  describe '.valid_move?' do
    let(:game) { Game.create() }
    let(:board) { [[nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil]] }
    let(:bishop) { Bishop.select { |x| x.color == 'white' && x.game_id == game.id && x.position_x == 2 } }
    let(:pawn) { Pawn.select { |x| x.color == 'white' && x.game_id == game.id && x.position_x == 3 } }

    it 'should return true for an unobstructed, diagonal move to to an empty space' do
      game_id = game.id
      board[bishop[0].position_y][bishop[0].position_x] = bishop[0].id
      stop = [4, 2]
      expect(bishop[0].valid_move?(board, stop)).to eq true
    end

    it 'should return false for an obstructed, diagonal move to an empty space' do
      game_id = game.id
      board[bishop[0].position_y][bishop[0].position_x] = bishop[0].id
      board[pawn[0].position_y][pawn[0].position_x] = pawn[0].id
      stop = [4, 2]
      expect(bishop[0].valid_move?(board, stop)).to eq false
    end

    it 'should return false for a horizontal move' do
      game_id = game.id
      board[bishop[0].position_y][bishop[0].position_x] = bishop[0].id
      stop = [4, 0]
      expect(bishop[0].valid_move?(board, stop)).to eq false
    end

    it 'should return false for a vertical move' do
      game_id = game.id
      board[bishop[0].position_y][bishop[0].position_x] = bishop[0].id
      stop = [2, 2]
      expect(bishop[0].valid_move?(board, stop)).to eq false
    end

    it 'should return true for a move to a space occupied by the opponent' do
      game_id = game.id
      white_bishop = Bishop.select { |x| x.color = 'white' && x.game_id == game.id && x.position_x == 2 }
      black_bishop = Bishop.select { |x| x.color = 'black' && x.game_id == game.id && x.position_x == 2 }
      board[white_bishop[0].position_y][white_bishop[0].position_x] = white_bishop[0].id
      board[3][5] = black_bishop[0].id
      stop = [5, 3]
      expect(white_bishop[0].valid_move?(board, stop)).to eq true
    end

    it 'should return false for a move to space occupied by your piece' do
      game_id = game.id
      board[bishop[0].position_y][bishop[0].position_x] = bishop[0].id
      board[pawn[0].position_y][pawn[0].position_x] = pawn[0].id
      stop = [3, 1]
      expect(bishop[0].valid_move?(board, stop)).to eq false
    end
  end

end