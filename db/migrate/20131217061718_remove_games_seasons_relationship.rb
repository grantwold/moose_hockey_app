class RemoveGamesSeasonsRelationship < ActiveRecord::Migration
  def up
  	drop_table :games_seasons

  	change_table :games do |t|
  		t.integer :season_id
  	end
  end

  def down
  	create_table :games_seasons do |t|
  		t.belongs_to :game
  		t.belongs_to :season
  	end
  	remove_column :games, :season_id
  end
end
