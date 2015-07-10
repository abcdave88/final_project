require 'rake'

every 5.minutes do
  rake 'shipping_data'
  puts 'Data Collected'
end