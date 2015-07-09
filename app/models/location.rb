class Location < ActiveRecord::Base
  belongs_to :ship

  def self.populate_database
    response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
    response['objects'].each do |location|
      Location.create(latitude: location["vessel"]["latitude"], longitude: location["vessel"]["longitude"], position_received: location["vessel"]["positionreceived"])
      # binding.pry
      # nil
    end
  end
end
