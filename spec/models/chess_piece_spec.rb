require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  it 'should be true' do
    expect(true).to eq true
  end

  describe ".is_vertical_move?" do
    let(:piece) { ChessPiece.create(id: 5, position_x: 0, position_y: 0) }

    it 'should return true for a vertical move' do
      stop = [0, 4]
      expect(piece.is_vertical_move?(stop)).to eq true
    end

    it 'should return false for a non-vertical move' do
      stop = [4, 0]
      expect(piece.is_vertical_move?(stop)).to eq false
    end
  end

  describe ".is_horizontal_move?" do
    let(:piece) { ChessPiece.create(position_x: 0, position_y: 0) }

    it 'should return true for a horizontal move' do
      stop = [4, 0]
      expect(piece.is_horizontal_move?(stop)).to eq true
    end

    it 'should return false for a non-horizontal move' do
      stop = [0, 4]
      expect(piece.is_horizontal_move?(stop)).to eq false
    end
  end

  describe ".is_diagonal_move?" do
    let(:piece) { ChessPiece.create(position_x: 0, position_y: 0) }

    it 'should return true for a diagonal move' do
      stop = [4, 4]
      expect(piece.is_diagonal_move?(stop)).to eq true
    end

    it "should return false for a non-diagonal move" do
      stop = [4, 5]
      expect(piece.is_diagonal_move?(stop)).to eq false
    end
  end

  describe ".is_obstructed?" do
    let(:board) { [[nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil]]}
    let(:piece1) { ChessPiece.create(id: 1, position_x: 0, position_y: 0) }
    let(:piece2) { ChessPiece.create(id: 2, position_x: 0, position_y: 2) }
    let(:stop) { [0, 4] }

    it 'should return true for an obstructed vertical move' do
      board[piece1.position_y][piece1.position_x] = piece1.id
      board[piece2.position_y][piece2.position_x] = piece2.id
      expect(piece1.is_obstructed?(board, stop)).to eq true
    end

    it 'should return false for a non-obstructed vertical move' do
      board[piece1.position_y][piece1.position_x] = piece1.id
      expect(piece1.is_obstructed?(board, stop)).to eq false
    end
  end

  describe ".is_obstructed?" do
    let(:board) { [[nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil]]}
    let(:piece1) { ChessPiece.create(id: 1, position_x: 0, position_y: 0) }
    let(:piece2) { ChessPiece.create(id: 2, position_x: 2, position_y: 0) }
    let(:stop) { [4, 0] }

    it 'should return true for an obstructed horizontal move' do
      board[piece1.position_y][piece1.position_x] = piece1.id
      board[piece2.position_y][piece2.position_x] = piece2.id
      expect(piece1.is_obstructed?(board, stop)).to eq true
    end

    it 'should return false for a non-obstructed horizontal move' do
      board[piece1.position_y][piece1.position_x] = piece1.id
      expect(piece1.is_obstructed?(board, stop)).to eq false
    end
  end

  describe ".is_obstructed?" do
    let(:board) { [[nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil]]}
    let(:piece1) { ChessPiece.create(id: 1, position_x: 0, position_y: 0) }
    let(:piece2) { ChessPiece.create(id: 2, position_x: 2, position_y: 2) }
    let(:stop) { [4, 4] }

    it 'should return true for an obstructed diagonal move' do
      board[piece1.position_y][piece1.position_x] = piece1.id
      board[piece2.position_y][piece2.position_x] = piece2.id
      expect(piece1.is_obstructed?(board, stop)).to eq true
    end

    it 'should return false for a non-obstructed diagonal move' do
      board[piece1.position_y][piece1.position_x] = piece1.id
      expect(piece1.is_obstructed?(board, stop)).to eq false
    end
  end

  describe ".is_space_occupied?" do
    let(:board) { [[nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [1, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil, nil]]}
    let(:piece) { ChessPiece.create(id: 1, position_x: 0, position_y: 0) }

    it 'should return true for an occupied space' do
      stop = [0, 3]
      expect(piece.is_space_occupied?(board, stop)).to eq true
    end

    it 'should return false for an unoccupied space' do
      stop = [0, 4]
      expect(piece.is_space_occupied?(board, stop)).to eq false
    end
  end

  # describe ".is_opponent?" do
  #   let(:board) { [[1, nil, nil, nil, nil, nil, nil, nil],
  #                  [2, nil, nil, nil, nil, nil, nil, nil],
  #                  [3, nil, nil, nil, nil, nil, nil, nil],
  #                  [nil, nil, nil, nil, nil, nil, nil, nil],
  #                  [nil, nil, nil, nil, nil, nil, nil, nil],
  #                  [nil, nil, nil, nil, nil, nil, nil, nil],
  #                  [nil, nil, nil, nil, nil, nil, nil, nil],
  #                  [nil, nil, nil, nil, nil, nil, nil, nil]]}
  #   let(:piece1) { ChessPiece.create(id: 1, color: 'black', position_x: 0, position_y: 0) }
  #   let(:piece2) { ChessPiece.create(id: 2, color: 'black', position_x: 0, position_y: 1) }
  #   let(:piece3) { ChessPiece.create(id: 3, color: 'white', position_x: 0, position_y: 2) }

  #   it 'should return true if the piece belongs to the opponent' do
  #     stop = [0, 2]
  #     # expect(piece1.is_opponent?(board, stop)).to eq true
  #     # piece = ChessPiece.find_by_id(3)
  #     expect(ChessPiece.find(3)).to eq piece3
  #   end

  #   # it 'should return false if the piece belongs to the same team' do
  #   #   stop = [0, 1]
  #   #   expect(piece1.is_opponent?(board, stop)).to eq false
  #   # end
  # end
end
