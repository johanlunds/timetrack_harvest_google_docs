require 'bundler/setup'
require 'harvested'
require 'date'

sub_domain = 'johantest'
email = 'johan.lundstrom@apoex.se'
pw = ENV['HARVEST_PW']

user_id = 720813 # Johan

date = Date.parse("2014-04-11")


client = Harvest.client(sub_domain, email, pw)
user = client.users.find(user_id)
time_entries = client.time.all(date, user)

puts time_entries.inspect