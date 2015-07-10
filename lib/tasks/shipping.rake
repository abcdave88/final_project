

task :shipping_data => :environment do 
  response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
  response['objects'].each do |ship|  
    s1 = Ship.find_or_create_by(name: ship["vessel"]["name"])
    s1.assign_attributes(heading: ship["vessel"]["heading"], status: ship["vessel"]["status"], lastport: ship["vessel"]["lastport"]["name"], flag: ship["vessel"]["flag"], photo: ship["vessel"]["photos"], mmsinumber: ship["vessel"]["mmsinumber"])
    s1.save
    puts s1
    # binding.pry
  end
  response['objects'].each do |location|
    mmsi = location["vessel"]["mmsinumber"]
    ship_id = Ship.where(mmsinumber: mmsi).ids.first 
    l1 = Location.find_or_create_by(latitude: location["vessel"]["latitude"], longitude: location["vessel"]["longitude"], position_received: location["vessel"]["positionreceived"], mmsinumber: location["vessel"]["mmsinumber"], ship_id: ship_id)
    puts l1 
  end

  response['objects'].each do |destination|
    mmsi = destination["vessel"]["mmsinumber"]
    ship_id = Ship.where(mmsinumber: mmsi).ids.first
    d1 = Destination.where(name: destination["vessel"]["destination"])
    # binding.pry
    # if d1.name == destination["vessel"]["destination"]
    #   d1.assign_attributes(eta_time: destination["vessel"]["etatime"])
    #   d1.save
    #   puts d1
    # else  
      d1 = Destination.find_or_create_by(name: destination["vessel"]["destination"], eta_time: destination["vessel"]["etatime"], mmsinumber: destination["vessel"]["mmsinumber"], ship_id: ship_id)
      puts d1
    # end
  end
end

# Ship.first.assign