require 'time'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    def convert(time_string)
      time = DateTime.parse(time_string).strftime("%m/%d/%Y %H:%M %p")
      return time
    end
end
