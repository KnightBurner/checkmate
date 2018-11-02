require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  describe '.move_one_space?' do
    let(:start) { [0, 0] }
    let(:king) { King.new() }

    it 'should return true of the move is one space' do
      stop = [0, 1]
      expect(king.move_one_space?(start[1], stop[1])).to eq true
    end

    it 'should return true if the move is more than one space' do
      stop = [0, 2]
      expect(king.move_one_space?(start[1], stop[1])).to eq false
    end
  end

  describe '.valid_move?' do
    let(:game) { Game.new() }
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
      stop = [4, 1]
      white_king = King.select { |x| x.color == 'white' && x.game_id == game.id }
      board[white_king[0].position_y][white_king[0].position_x] = white_king.id
      expect(white_king[0].valid_move?()).to eq true
    end

    it 'should return true for a move to a space with an opponents piece' do

      black_king = King.select { |x| x.color == 'black' && x.game_id == game.id }
    end

    it 'should return false for a move of more than one space' do

    end

    it 'should return false for a move to a space with your own piece' do

    end
  end

end