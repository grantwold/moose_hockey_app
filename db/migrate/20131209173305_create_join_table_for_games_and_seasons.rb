class CreateJoinTableForGamesAndSeasons < ActiveRecord::Migration
  def up
  	create_table :games_seasons do |t|
  		t.belongs_to :game
  		t.belongs_to :season
  	end

  	change_table :games do |t|
  		t.remove :season_id
  	end
  end

  def down
  	change_table :games do |t|
  		t.belongs_to :season
  	end

  	drop_table :games_seasons
  end
end
