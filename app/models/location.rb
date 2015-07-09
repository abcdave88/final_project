class Location < ActiveRecord::Base
  belongs_to :ship

  def self.populate_database
    response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
    response['objects'].each do |location|
      mmsi = location["vessel"]["mmsinumber"]
      ship_id = Ship.where(mmsinumber: mmsi).ids.first
      Location.create(latitude: location["vessel"]["latitude"], longitude: location["vessel"]["longitude"], position_received: location["vessel"]["positionreceived"], mmsinumber: location["vessel"]["mmsinumber"], ship_id: ship_id)
      
      # binding.pry
      # nil
    end
  end
end
