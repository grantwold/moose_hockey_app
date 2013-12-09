class AddPracticeAndScrimmageToGames < ActiveRecord::Migration
  def up
  	add_column :games, :scrimmage, :boolean
  	add_column :games, :practice, :boolean
  end

  def down
  	remove_column :games, :scrimmage
  	remove_column :games, :practice
  end
end
