class ShipsController < ApplicationController
  respond_to :html, :json

  def index
    @ships = Ship.all
    @locations = Location.all
    @destinations = Destination.all

    # count = 1
    # while count < Ship.count
    #   @current_location = Location.where(ship_id: count).last
    #   @prev_location = Location.where(ship_id: count)
    #   @destination = Destination.where(ship_id: count).last
    #   @ship = Ship.where(id: count)
    #   @response = { :ship => @ship, :current_location => @current_location, :prev_location => @prev_location, :destination => @destination }
    #   respond_with @response, :location => root_path
    #   count +=1
    # end
    @response = { :ships => @ships, :locations => @locations, :destinations => @destinations }
    respond_with @response, :location => root_path
    # respond_with @ships, :location => root_path


  end

end
