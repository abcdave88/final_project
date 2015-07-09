class AddNoToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :mmsinumber, :string
  end
end
