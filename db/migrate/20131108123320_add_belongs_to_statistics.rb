class AddBelongsToStatistics < ActiveRecord::Migration
  def change
  	add_column :statistics, :games_id, :integer
  end
end
