class AddShotsOnGoal < ActiveRecord::Migration
  def up
  	add_column :games, :opponents_shots_on_goal, :integer
  	add_column :games, :moose_shots_on_goal, :integer
  end

  def down
  	remove_column :games, :opponents_shots_on_goal
  	remove_column :games, :moose_shots_on_goal
  end
end
