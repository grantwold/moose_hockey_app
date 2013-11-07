class RemoveFirstAndLastNameFromPlayersModel < ActiveRecord::Migration
  def up
  	remove_column :players, :firstname
  	remove_column :players, :lastname
  	add_column :players, :name, :string
  end

  def down
  	add_column :players, :firstname, :string
  	add_column :players, :lastname, :string
  	remove_column :players, :name
  end
end
