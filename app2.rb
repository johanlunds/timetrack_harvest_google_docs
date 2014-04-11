require 'bundler/setup'
require 'harvested'
require 'date'

require './time_tracker/fetch_time_entries'
require './time_tracker/time_entry'

sub_domain = 'johantest'
email = 'johan.lundstrom@apoex.se'
pw = ENV['HARVEST_PW']
user_id = 720813 # Johan

num_dates = 1
from_date = Date.today

client = Harvest.client(sub_domain, email, pw)
fetcher = TimeTracker::FetchTimeEntries.new(client, user_id, from_date, num_dates)
time_entries = fetcher.fetch

puts time_entries.inspect

