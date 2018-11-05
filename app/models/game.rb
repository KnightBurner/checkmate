class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil) }
  has_one :player, class_name: 'User', foreign_key: "black_player_id"
  has_one :player, class_name: 'User', foreign_key: "white_player_id"

  has_many :chess_pieces

  after_create :populate_board!

  def populate_board!
    # white pieces
    (0..7).each do |w|
      ChessPiece.create(type: Pawn, game_id: id, position_x: w, position_y: 1, color: 'white')
    end

    ChessPiece.create(type: Rook, game_id: id, position_x: 0, position_y: 0, color: 'white')
    ChessPiece.create(type: Rook, game_id: id, position_x: 7, position_y: 0, color: 'white')
  
    ChessPiece.create(type: Knight, game_id: id, position_x: 1, position_y: 0, color: 'white')
    ChessPiece.create(type: Knight, game_id: id, position_x: 6, position_y: 0, color: 'white')
  
    ChessPiece.create(type: Bishop, game_id: id, position_x: 2, position_y: 0, color: 'white')
    ChessPiece.create(type: Bishop, game_id: id, position_x: 5, position_y: 0, color: 'white')
  
    ChessPiece.create(type: Queen, game_id: id, position_x: 3, position_y: 0, color: 'white')
    ChessPiece.create(type: King, game_id: id, position_x: 4, position_y: 0, color: 'white')
  
    # black pieces
    (0..7).each do |b|
      ChessPiece.create(type: Pawn, game_id: id, position_x: b, position_y: 6, color: 'black')
    end

    ChessPiece.create(type: Rook, game_id: id, position_x: 0, position_y: 7, color: 'black')
    ChessPiece.create(type: Rook, game_id: id, position_x: 7, position_y: 7, color: 'black')
  
    ChessPiece.create(type: Knight, game_id: id, position_x: 1, position_y: 7, color: 'black')
    ChessPiece.create(type: Knight, game_id: id, position_x: 6, position_y: 7, color: 'black')
  
    ChessPiece.create(type: Bishop, game_id: id, position_x: 2, position_y: 7, color: 'black')
    ChessPiece.create(type: Bishop, game_id: id, position_x: 5, position_y: 7, color: 'black')
  
    ChessPiece.create(type: Queen, game_id: id, position_x: 3, position_y: 7, color: 'black')
    ChessPiece.create(type: King, game_id: id, position_x: 4, position_y: 7, color: 'black')
  end
  
  def piece_at(x, y)
    chess_pieces.where(position_x: x, position_y: y).first
  end
end