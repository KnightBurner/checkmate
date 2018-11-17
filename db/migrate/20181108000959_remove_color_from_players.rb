class RemoveColorFromPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :color, :string
  end
end
