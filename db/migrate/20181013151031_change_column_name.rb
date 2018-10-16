class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :chess_pieces, :postion_x, :position_x
    rename_column :chess_pieces, :postion_y, :position_y
  end
end
