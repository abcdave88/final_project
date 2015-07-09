class AddNoToShip < ActiveRecord::Migration
  def change
    add_column :ships, :mmsinumber, :string
  end
end
