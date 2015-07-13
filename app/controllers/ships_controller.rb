class ShipsController < ApplicationController
  respond_to :html, :json

  def index
    # @ships = Ship.all.includes(:locations, :destinations)
    # @locations = Location.all
    # @destinations = Destination.all


    ###############THE BIG ACHE EFFORT###############
    @ships = Ship.order('id ASC')

    @location_1 = Location.where(ship_id: 1).all
    @location_2 = Location.where(ship_id: 2).all
    @location_3 = Location.where(ship_id: 3).all
    @location_4 = Location.where(ship_id: 4).all
    @location_5 = Location.where(ship_id: 5).all
    @location_6 = Location.where(ship_id: 6).all
    @location_7 = Location.where(ship_id: 7).all
    @location_8 = Location.where(ship_id: 8).all

    @destination_1 = Destination.where(ship_id: 1).all
    @destination_2 = Destination.where(ship_id: 2).all
    @destination_3 = Destination.where(ship_id: 3).all
    @destination_4 = Destination.where(ship_id: 4).all
    @destination_5 = Destination.where(ship_id: 5).all
    @destination_6 = Destination.where(ship_id: 6).all
    @destination_7 = Destination.where(ship_id: 7).all
    @destination_8 = Destination.where(ship_id: 8).all

    @response = {:ships => @ships,  :location_1 => @location_1,
                                    :location_2 => @location_2,
                                    :location_3 => @location_3,
                                    :location_4 => @location_4,
                                    :location_5 => @location_5,
                                    :location_6 => @location_6,
                                    :location_7 => @location_7,
                                    :location_8 => @location_8,
                                    :destination_1 => @destination_1,
                                    :destination_2 => @destination_2,
                                    :destination_3 => @destination_3,
                                    :destination_4 => @destination_4,
                                    :destination_5 => @destination_5,
                                    :destination_6 => @destination_6,
                                    :destination_7 => @destination_7,
                                    :destination_8 => @destination_8
                                                                } 
                
    respond_with @response, :location => root_path

    #################################################

    # the big blob attempt #
    # @response = { :ships => @ships, :locations => @locations, :destinations => @destinations }
    # respond_with @response, :location => root_path

    #cant access associations on client side
    # respond_with @ships, :location => root_path


    # turns page into json object
    # render json: @ships

  end

end
