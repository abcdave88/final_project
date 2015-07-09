class LocationsController < ApplicationController

  def index
    Location.populate_database
  end


end
