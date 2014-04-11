module Spreadsheet
  class TimeSpreadsheet

    attr_reader :ws

    def initialize(session, spreadsheet_id)
      @ws = session.spreadsheet_by_key(spreadsheet_id).worksheets[0]
    end

    START_ROWS = 2
    MAX_ROWS = 1000
    DATE_COL = 1

    # returns TimeEntry for date
    # returns nil if TimeEntry not found
    def get_entry_for_date(date)
      (START_ROWS..MAX_ROWS).each do |row|
        if parse_date(ws[row, DATE_COL]) == date
          return TimeEntry.new(date, ws, row)
        end
      end
    end

    def save
      ws.save
    end

    private

    DATE_FORMAT = '%m/%d/%Y'

    def parse_date(string)
      # 4/11/2014 => 2014-4-11
      Date.strptime(string, DATE_FORMAT)
    end
    
  end
end
