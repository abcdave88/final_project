require 'multi_xml'
require 'httparty'

class Ship < ActiveRecord::Base
  has_many :locations
  has_many :destinations


  def self.populate_database
    response = HTTParty.get("http://www.fleetmon.com/api/p/personal-v1/myfleet/?username=#{ENV["FLEETMON_ID"]}&api_key=#{ENV["FLEETMON_API_KEY"]}&format=json")
    count = 0
    while count < response["objects"].length do 
      
    end
    binding.pry
    nil
  end

end