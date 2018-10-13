class Game < ApplicationRecord
  has_many :chess_pieces

  
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
end
