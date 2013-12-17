class AddOpponentsToGames < ActiveRecord::Migration
  def up
  	change_table :games do |t|
  		t.remove :goals
  		t.remove :assists
  		t.remove :shorthandedgoals
  		t.remove :powerplaygoals
  		t.remove :penalties
  		t.integer :moose_goals
  		t.integer :opponent_goals
  		t.integer :moose_assists
  		t.integer :opponent_assists
  		t.integer :moose_shg
  		t.integer :opponent_shg
  		t.integer :moose_ppg
  		t.integer :opponent_ppg
  		t.integer :moose_penalties
  		t.integer :opponent_penalties
  	end
  end

  def down
  	change_table :games do |t|
  		t.integer :goals
  		t.integer :assists
  		t.integer :shorthandedgoals
  		t.integer :powerplaygoals
  		t.integer :penalties
  		t.remove :moose_goals
  		t.remove :opponent_goals
  		t.remove :moose_assists
  		t.remove :opponent_assists
  		t.remove :moose_shg
  		t.remove :opponent_shg
  		t.remove :moose_ppg
  		t.remove :opponent_ppg
  		t.remove :moose_penalties
  		t.remove :opponent_penalties
  	end
  end
end
