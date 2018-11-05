require 'rails_helper'

RSpec.describe King, type: :model do
  describe '.move_one_space?' do
    let(:game) { Game.create() }

    it 'should return true if the move is one space' do
      game_id = game.id
      stop = [4, 1]
      king = King.select { |x| x.position_x == 4 && x.position_y == 0 }
      expect(king[0].move_one_space?(stop)).to eq true
    end

    it 'should return true if the move is more than one space' do
      game_id = game.id
      stop = [4, 2]
      king = King.select { |x| x.position_x == 4 && x.position_y == 0 }
      expect(king[0].move_one_space?(stop)).to eq false
    end
  end

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

    it 'should return true for a move to an empty space' do
      game_id = game.id
      white_king = King.select { |x| x.color == 'white' && x.game_id == game.id }
      board[white_king[0].position_y][white_king[0].position_x] = white_king[0].id
      stop = [4, 1]
      expect(white_king[0].valid_move?(board, stop)).to eq true
    end

    it 'should return true for a move to a space with an opponents piece' do
      game_id = game.id
      white_king = King.select { |x| x.color == 'white' && x.game_id == game.id }
      black_king = King.select { |x| x.color == 'black' && x.game_id == game.id }
      board[white_king[0].position_y][white_king[0].position_x] = white_king[0].id
      board[1][4] = black_king[0].id
      stop = [4, 1]
      expect(white_king[0].valid_move?(board, stop)).to eq true
    end

    it 'should return false for a move of more than one space' do
      game_id = game.id
      white_king = King.select { |x| x.color == 'white' && x.game_id == game.id }
      board[white_king[0].position_y][white_king[0].position_x] = white_king[0].id
      stop = [4, 2]
      expect(white_king[0].valid_move?(board, stop)).to eq false
    end

    it 'should return false for a move to a space with your own piece' do
      game_id = game.id
      white_king = King.select { |x| x.color == 'white' && x.game_id == game.id }
      white_queen = Queen.select { |x| x.color == 'white' && x.game_id == game.id }
      board[white_king[0].position_y][white_king[0].position_x] = white_king[0].id
      board[white_queen[0].position_y][white_queen[0].position_x] = white_queen[0].id
      stop = [white_queen[0].position_x, white_queen[0].position_y]
      expect(white_king[0].valid_move?(board, stop)).to eq false
    end
  end

end