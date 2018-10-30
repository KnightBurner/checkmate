require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  it 'should be true' do
    expect(true).to eq true
  end

  describe ".is_vertical_move?" do
    it 'should return true for a vertical move' do
      piece = ChessPiece.new(position_x: 0, position_y: 0)
      stop = [0, 4]
      expect(piece.is_vertical_move?(stop)).to eq true
    end

    it 'should return false for a non-vertical move' do
      piece = ChessPiece.new(position_x: 0, position_y: 0)
      stop = [4, 0]
      expect(piece.is_vertical_move?(stop)).to eq false
    end
  end

  describe ".is_horizontal_move?" do
    it 'should return true for a horizontal move' do
      piece = ChessPiece.new(position_x: 0, position_y: 0)
      stop = [4, 0]
      expect(piece.is_horizontal_move?(stop)).to eq true
    end

    it 'should return false for a non-horizontal move' do
      piece = ChessPiece.new(position_x: 0, position_y: 0)
      stop = [0, 4]
      expect(piece.is_horizontal_move?(stop)).to eq false
    end
  end

  describe ".is_diagonal_move?" do
    it 'should return true for a diagonal move' do
      piece = ChessPiece.new(position_x: 0, position_y: 0)
      stop = [4, 4]
      expect(piece.is_diagonal_move?(stop)).to eq true
    end

    it "should return false for a non-diagonal move" do
      piece = FactoryBot.create(:chess_piece)
      stop = [4, 5]
      expect(piece.is_diagonal_move?(stop)).to eq false
    end
  end

  # describe ".is_vertically_obstructed?" do
  #   it 'should return true for an obstructed vertical move' do
  #     board = FactoryBot.create(:board)
  #     # piece = ChessPiece.new(position_x: 0, position_y: 0)
  #     # board[0][0] = piece.id
  #     # board[0][1] = 1
  #     # stop = [0, 4]
  #     expect(board[0][0]).to eq nil
  #   end
  # end

  # it '.is_vertically_obstructed? should return false for a non-obstructed vertical move' do

  # end

  # it '.is_horizontally_obstructed? should return true for an obstructed horizontal move' do

  # end

  # it '.is_horizontally_obstructed? should return false for a non-obstructed horizontal move' do

  # end

  # it '.is_diagonally_obstructed? should return true for an obstructed diagonal move' do

  # end

  # it '.is_diagonally_obstructed? should return false for a non-obstructed diagonal move' do

  # end
end
