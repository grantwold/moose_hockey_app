class SplitDateAndTimeInGames < ActiveRecord::Migration
  def up
   	remove_column :games, :time
  	add_column :games, :time, :time
  	add_column :games, :date, :date
  end

  def down
  	remove_column :games, :time
  	remove_column :games, :date
  end
end
