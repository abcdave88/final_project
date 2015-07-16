class AddTwoColoumsToShip < ActiveRecord::Migration
  def change
    add_column :ships, :speed, :string
    add_column :ships, :destination, :string
  end
end
