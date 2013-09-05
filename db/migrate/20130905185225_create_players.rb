class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :firstname
      t.string :lastname
      t.integer :number
      t.integer :gamesplayed
      t.integer :goals
      t.integer :assists
      t.integer :shorthandedgoals
      t.integer :powerplaygoals
      t.integer :penalties

      t.timestamps
    end
  end
end
