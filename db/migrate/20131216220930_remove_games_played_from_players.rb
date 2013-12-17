class RemoveGamesPlayedFromPlayers < ActiveRecord::Migration
  def up
  	remove_column :players, :gamesplayed
  end

  def down
  	add_column :players, :gamesplayed, :integer
  end
end
