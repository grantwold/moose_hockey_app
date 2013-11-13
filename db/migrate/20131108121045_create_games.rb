class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.belongs_to :player
    	t.belongs_to :season
    	t.belongs_to :statistic

      	t.timestamps
    end
  end
end
