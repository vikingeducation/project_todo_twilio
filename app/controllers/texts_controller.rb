class TextsController < ApplicationController

  def get_phone_number

  end

  def send_text
    number = params[:number]
    @send_message = TwilioApi.new.send_message( "Hello, world", "+17322991948" )
    if @send_message
      flash[:success] = "reminder sent"
    else
      flash[:error] = "Something went wrong..."
    end
  end

end
