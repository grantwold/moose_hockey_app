class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.belongs_to :player
    	t.belongs_to :game
    	t.belongs_to :season
    	
		t.timestamps
    end
  end
end
