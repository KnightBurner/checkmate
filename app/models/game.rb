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
  scope :available, -> { where(black_player_id: nil).or(where(white_player_id: nil)) }
  
  def check?(color)
    king = chess_pieces.find_by(type: 'King', color: color)
    opponents = chess_pieces.find_by(color: color!)
    opponents.each do |chess_piece|
      if chess_piece.valid_move?(king.position_x, king.position_y)
        @chess_piece_causing_check = chess_piece
        return true
        end
      false
   end
  end
  
  def checkmate?(color)
    checked_king = chess_pieces.find_by(type: 'King', color: color)
    return false unless check?(color)
    pieces = chess_pieces.find_by(color: color)
    pieces.each do |piece|
     (0..7).each do |x|
       (0..7).each do |y|
         if piece.valid_move?(x, y)
           Game.transaction do
             piece.move_to!([x, y])
             if check?(color) == false
               raise ActiveRecord::Rollback
               return false
             end
             raise ActiveRecord::Rollback
          end
        end
      end
    end
  end
return true
  end
end