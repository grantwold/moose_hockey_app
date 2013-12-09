class SplitDateAndTimeInGames < ActiveRecord::Migration
  def up
  	add_column :games, :time, :time
  	add_column :games, :date, :date
  end

  def down
  	remove_column :games, :date
  	remove_column :games, :time
  end
end
