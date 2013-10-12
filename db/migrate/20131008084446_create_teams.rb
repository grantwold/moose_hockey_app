class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.date :season_start
      t.date :season_end

      t.timestamps
    end
  end
end
