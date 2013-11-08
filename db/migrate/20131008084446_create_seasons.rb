class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :season_start
      t.date :season_end

      t.timestamps
    end
  end
end
