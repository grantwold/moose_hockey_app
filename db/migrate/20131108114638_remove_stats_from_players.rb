class RemoveStatsFromPlayers < ActiveRecord::Migration
  def up
  	remove_column :players, :goals
  	remove_column :players, :assists
  	remove_column :players, :shorthandedgoals
  	remove_column :players, :powerplaygoals
  	remove_column :players, :penalties
  end

  def down
  	add_column :players, :goals
  	add_column :players, :assists
  	add_column :players, :shorthandedgoals
  	add_column :players, :powerplaygoals
  	add_column :players, :penalties
  end
end
