class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :position_received

      t.timestamps null: false
    end
  end
end
