class Destination < ActiveRecord::Base
  belongs_to :ship

  def self.populate_database
    response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
    response['objects'].each do |location|
      Destination.create(name: location["vessel"]["destination"], eta_time: location["vessel"]["etatime"])
      # binding.pry
      # nil
    end
  end
end
