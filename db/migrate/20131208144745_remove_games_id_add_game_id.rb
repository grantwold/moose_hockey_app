class RemoveGamesIdAddGameId < ActiveRecord::Migration
  def up
  	add_column :statistics, :game_id, :integer
  	remove_column :statistics, :games_id
  end

  def down
  	remove_column :statistics, :game_id
  end
end
