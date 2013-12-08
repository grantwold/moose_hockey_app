class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
    	t.integer :goals
    	t.integer :assists
    	t.integer :shorthandedgoals
    	t.integer :powerplaygoals
    	t.integer :penalties

      t.belongs_to :games
      
      t.timestamps
    end
  end
end
