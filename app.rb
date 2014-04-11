require 'bundler/setup'
require 'google_drive'
require 'date'

require './models'

username = 'johanlunds@gmail.com'
pw = ENV['GOOGLE_DRIVE_PW'] # hdsrmcwcrodcrdod
spreadsheet_key = '0ApLJ7ZN_JZqEdExqak5COEg2VFBMbW1vT1d3MWE5OUE' # Copy of Johan L (temp)



session = GoogleDrive.login(username, pw)

sheet = TimeSpreadsheet.new(session, spreadsheet_key)

date = Date.parse("2014-4-11")
entry = sheet.get_entry_for_date(date)

puts entry.helpdesk

entry.maintenance = 3

puts entry.maintenance

# sheet.save

# rows, cols
# p sheet.parse_date(sheet.ws[2, 1]).inspect

