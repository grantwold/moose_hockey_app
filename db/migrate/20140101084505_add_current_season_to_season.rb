class AddCurrentSeasonToSeason < ActiveRecord::Migration
  def change
  	add_column :seasons, :current_season, :boolean, default: false
  end
end
