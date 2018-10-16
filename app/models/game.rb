class Game < ApplicationRecord
  scope :available, -> { where(black_player_id: nil).or(where(white_player_id: nil)) }
  
  def piece_at_(x, y)
    chess_pieces.where(position_x: x, position_y: y).first
  end
end
