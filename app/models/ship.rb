class Ship < ActiveRecord::Base
  has_many :locations
  has_many :destinations
end


def self.populate_database

end