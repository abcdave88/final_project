class AddShipIdToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :ship_id, :integer
  end
end
