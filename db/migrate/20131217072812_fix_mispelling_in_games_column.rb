class FixMispellingInGamesColumn < ActiveRecord::Migration
  def up
  	change_table :games do |t|
  		t.rename :opponents_shots_on_goal, :opponent_shots_on_goal
  	end
  end

  def down
  	change_table :games do |t|
  		t.rename :opponent_shots_on_goal, :opponents_shots_on_goal
  	end
  end
end
