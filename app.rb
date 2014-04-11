require 'bundler/setup'
require 'google_drive'
require 'date'

username = 'johanlunds@gmail.com'
pw = ENV['GOOGLE_DRIVE_PW'] # hdsrmcwcrodcrdod
spreadsheet_key = '0ApLJ7ZN_JZqEdExqak5COEg2VFBMbW1vT1d3MWE5OUE' # Copy of Johan L (temp)

class TimeSpreadsheet

  attr_reader :ws

  def initialize(session, spreadsheet_key)
    @ws = session.spreadsheet_by_key(spreadsheet_key).worksheets[0]
  end

  def get_entry_for_date(date)
    row = 2 # TODO: implement
    TimeEntry.new(date, ws, row)
  end

  def save
    ws.save
  end
  
end

class TimeEntry

  MEASUREMENTS  = [:helpdesk, :maintenance, :development]
  PREV_COLS = 1

  attr_reader :date, :ws, :row

  def initialize(date, ws, row)
    @date = date
    @ws = ws
    @row = row
  end

  MEASUREMENTS.each_with_index do |col, i|
    define_method col do
      ws[row, PREV_COLS + i + 1]
    end

    define_method "#{col}=" do |value|
      ws[row, PREV_COLS + i + 1] = value
    end

  end

end

session = GoogleDrive.login(username, pw)

sheet = TimeSpreadsheet.new(session, spreadsheet_key)

date = Date.parse("2014-4-11")
entry = sheet.get_entry_for_date(date)

puts entry.helpdesk

entry.maintenance = 3

puts entry.maintenance

sheet.save

# rows, cols
# p sheet.parse_date(sheet.ws[2, 1]).inspect

