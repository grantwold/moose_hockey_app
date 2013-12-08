class AddColumnsToGames < ActiveRecord::Migration
  def change
  	add_column :games, :location, :string
  	add_column :games, :opponent, :string
  	add_column :games, :time, :datetime
  	add_column :games, :official, :boolean
  end
end
