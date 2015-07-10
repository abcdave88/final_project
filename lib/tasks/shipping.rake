require 'whenever'
task :shipping_data => :environment do 
  response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
  response['objects'].each do |ship|  
    s1 =Ship.find_or_create_by(name: ship["vessel"]["name"], heading: ship["vessel"]["heading"], status: ship["vessel"]["status"], lastport: ship["vessel"]["lastport"]["name"], flag: ship["vessel"]["flag"], photo: ship["vessel"]["photos"], mmsinumber: ship["vessel"]["mmsinumber"])
    puts s1
    # binding.pry
  end
  # binding.pry
  # response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
  response['objects'].each do |location|
    mmsi = location["vessel"]["mmsinumber"]
    ship_id = Ship.where(mmsinumber: mmsi).ids.first
    l1 = Location.create(latitude: location["vessel"]["latitude"], longitude: location["vessel"]["longitude"], position_received: location["vessel"]["positionreceived"], mmsinumber: location["vessel"]["mmsinumber"], ship_id: ship_id)
    puts l1 
  end
  # response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
  response['objects'].each do |destination|
    mmsi = destination["vessel"]["mmsinumber"]
    ship_id = Ship.where(mmsinumber: mmsi).ids.first
    d1 = Destination.create(name: destination["vessel"]["destination"], eta_time: destination["vessel"]["etatime"], mmsinumber: destination["vessel"]["mmsinumber"], ship_id: ship_id)
    puts d1 
    # binding.pry
    # nil
  end
end