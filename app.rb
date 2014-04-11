require 'bundler/setup'
require 'google_drive'
require 'date'

require './time_entry'
require './time_spreadsheet'

username = 'johanlunds@gmail.com'
pw = ENV['GOOGLE_DRIVE_PW'] # hdsrmcwcrodcrdod
spreadsheet_id = '0ApLJ7ZN_JZqEdExqak5COEg2VFBMbW1vT1d3MWE5OUE' # Copy of Johan L (temp)



session = GoogleDrive.login(username, pw)

sheet = Spreadsheet::TimeSpreadsheet.new(session, spreadsheet_id)

date = Date.parse("2014-11-29")
entry = sheet.get_entry_for_date(date)

puts entry.helpdesk

entry.maintenance = 3

puts entry.maintenance

# sheet.save

# rows, cols
# p sheet.parse_date(sheet.ws[2, 1]).inspect

