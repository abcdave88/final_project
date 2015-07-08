class AddShipIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :ship_id, :integer
  end
end
