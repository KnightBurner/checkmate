require 'rails_helper'

RSpec.describe Queen, type: :model do

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
    let(:queen) { Queen.select { |x| x.color == 'white' && x.game_id == game.id } }
    let(:pawn) { Pawn.select { |x| x.color == 'white' && x.game_id == game.id && x.position_x == 3 } }
    let(:white_queen) { Queen.select { |x| x.color == 'white' && x.game_id == game.id } }
    let(:black_queen) { Queen.select { |x| x.color == 'black' && x.game_id == game.id } }

    it 'should return true for a move to an unobstructed, empty space' do
      game_id = game.id
      board[queen[0].position_y][queen[0].position_x] = queen[0].game_id
      stop = [3, 3]
      expect(queen[0].valid_move?(board, stop)).to eq true
    end

    it 'should return false for a move to an obstructed, empty space' do
      game_id = game.id
      board[queen[0].position_y][queen[0].position_x] = queen[0].id
      board[pawn[0].position_y][pawn[0].position_x] = pawn[0].id
      stop = [3, 1]
      expect(queen[0].valid_move?(board, stop)).to eq false
    end

    it 'should return true for a move to an unobstructed space occupied by the opponent' do
      game_id = game.id

      board[white_queen[0].position_y][white_queen[0].position_x] = white_queen[0].id
      board[2][3] = black_queen[0].id
      stop = [3, 2]
      expect(white_queen[0].valid_move?(board, stop)).to eq true
    end

    it 'should return false for a move to an unobstructed space occupied by your piece' do
      game_id = game.id
      board[queen[0].position_y][queen[0].position_x] = queen[0].id
      board[pawn[0].position_y][pawn[0].position_x] = pawn[0].id
      stop = [3, 2]
      expect(queen[0].valid_move?(board, stop)).to eq false
    end
  end

end