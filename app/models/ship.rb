require 'multi_xml'
require 'httparty'

class Ship < ActiveRecord::Base
  has_many :locations
  has_many :destinations


  def self.populate_database
    response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")

    while count < response["objects"].length do 
      count = 0
      ship_name = response["objects"][count]["vessel"]["name"]
      heading = response["objects"][count]["vessel"]["heading"]
      status = response["objects"][count]["vessel"]["navigationstatus"]
      last_port = response["objects"][count]["vessel"]["lastport"]["name"]
      flag = response["objects"][count]["vessel"]["flag"]
      photo = response["objects"][count]["vessel"]["photos"]
      ship = Ship.new
      ship.assign_attributes({:name "#{ship_name}", :heading "#{heading}", :status "#{status}", :lastport "#{last_port}", :flag "#{flag}", :photo "#{photo}"})
      # @ship = Ship.new(:name "#{ship_name}", :heading "#{heading}", :status "#{status}", :lastport "#{last_port}", :flag "#{flag}", :photo "#{photo}")
      ship.save
      count =+1
      binding.pry
      nil
    end

  end

end