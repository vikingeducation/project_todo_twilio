require 'time'
module TodosHelper
  class Order
    def convert(time_string)
      time = DateTime.parse(time_string).strftime("%m/%d/%Y %H:%M %p")
      return time
    end
  end
end
