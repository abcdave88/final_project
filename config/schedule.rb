require 'rake'

set :environment, 'development'

every 5.minutes do
  rake 'shipping_data'
  puts 'Data Collected'
end