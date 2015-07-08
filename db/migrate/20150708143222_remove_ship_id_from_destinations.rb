class RemoveShipIdFromDestinations < ActiveRecord::Migration
  def change
    remove_column :destinations, :shiip_id
  end
end
