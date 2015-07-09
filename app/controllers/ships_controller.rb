class ShipsController < ApplicationController

  def index
    Ship.populate_database
  end

end
