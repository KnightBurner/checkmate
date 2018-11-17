class AddPlayerIdToChessPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :chess_pieces, :player_id, :integer
  end
end
