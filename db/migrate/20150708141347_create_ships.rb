class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.string :heading
      t.string :status
      t.string :lastport
      t.string :flag
      t.string :photo

      t.timestamps null: false
    end
  end
end
