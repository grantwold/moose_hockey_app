class ChangeGamesAssociation < ActiveRecord::Migration
  def up
  	change_table :games do |t|
  		t.remove :player_id
  	end
  end

  def down
  	change_table :games do |t|
  		t.integer :player_id
  	end
  end
end
