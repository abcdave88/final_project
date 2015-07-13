class ShipsController < ApplicationController
  respond_to :html, :json

  def index
    @ships = Ship.all.includes(:locations, :destinations)
    @locations = Location.all
    @destinations = Destination.all


    # the big blob attempt #
    # @response = { :ships => @ships, :locations => @locations, :destinations => @destinations }
    # respond_with @response, :location => root_path

    #cant access associations on client side
    # respond_with @ships, :location => root_path


    # turns page into json object
    # render json: @ships

  end

end
