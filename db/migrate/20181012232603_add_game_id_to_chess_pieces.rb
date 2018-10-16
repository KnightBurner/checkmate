class AddGameIdToChessPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :chess_pieces, :game_id, :integer
  end
end
