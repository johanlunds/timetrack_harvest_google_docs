require 'bundler/setup'
require 'google_drive'

username = 'johanlunds@gmail.com'
pw = ENV['GOOGLE_DRIVE_PW'] # hdsrmcwcrodcrdod
spreadsheet_key = '0ApLJ7ZN_JZqEdExqak5COEg2VFBMbW1vT1d3MWE5OUE' # Copy of Johan L (temp)

class TimeSpreadsheet

  attr_reader :ws

  def initialize(session, spreadsheet_key)
    @ws = session.spreadsheet_by_key(spreadsheet_key).worksheets[0]
  end
  
  def parse_date(string)
    Date.parse(string)
  end

  def get_value
    
  end
end

session = GoogleDrive.login(username, pw)

sheet = TimeSpreadsheet.new(session, spreadsheet_key)

# rows, cols
p sheet.parse_date(sheet.ws[2, 1]).inspect

