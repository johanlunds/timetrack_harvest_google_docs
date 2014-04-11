module TimeTracker
  # service-class
  class FetchTimeEntries

    attr_reader :client, :user_id, :from_date, :num_dates

    # TODO: boundary checking for dates + num_dates
    def initialize(client, user_id, from_date, num_dates)
      @client = client
      @user_id = user_id
      @num_dates = num_dates
    end
    
    def fetch
      # date = Date.parse("2014-04-11")



      # user = client.users.find(user_id)
      # time_entries = client.time.all(date, user)

      # puts time_entries.inspect
    end
  end  
end
