class ShipsController < ApplicationController

  def index
    Ship.populate_database
    Location.populate_database
    Destination.populate_database
  end

end
