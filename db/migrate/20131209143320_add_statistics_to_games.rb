class AddStatisticsToGames < ActiveRecord::Migration
  def up
  	add_column :games, :goals, :integer
  	add_column :games, :assists, :integer
  	add_column :games, :shorthandedgoals, :integer
  	add_column :games, :powerplaygoals, :integer
  	add_column :games, :penalties, :integer
  end

  def down
	remove_column :games, :goals
  	remove_column :games, :assists
  	remove_column :games, :shorthandedgoals
  	remove_column :games, :powerplaygoals
  	remove_column :games, :penalties
  end
end
