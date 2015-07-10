class Destination < ActiveRecord::Base
  belongs_to :ship

  # def self.populate_database
  #   response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
  #   response['objects'].each do |destination|
  #     mmsi = destination["vessel"]["mmsinumber"]
  #     ship_id = Ship.where(mmsinumber: mmsi).ids.first
  #     Destination.create(name: destination["vessel"]["destination"], eta_time: destination["vessel"]["etatime"], mmsinumber: destination["vessel"]["mmsinumber"], ship_id: ship_id)
  #     # binding.pry
  #     # nil
  #   end
  # end
end
