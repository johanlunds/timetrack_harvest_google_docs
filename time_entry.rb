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