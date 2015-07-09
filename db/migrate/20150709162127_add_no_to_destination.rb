class AddNoToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :mmsinumber, :string
  end
end
