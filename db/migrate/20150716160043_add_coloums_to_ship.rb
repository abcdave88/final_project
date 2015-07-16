class AddColoumsToShip < ActiveRecord::Migration
  def change
    add_column :ships, :eta, :string
  end
end
