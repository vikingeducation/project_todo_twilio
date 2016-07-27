class TextsController < ApplicationController

  def get_phone_number

  end

  def send_text
    number = params[:number]
    @send_message = TwilioApi.new.send_message( "Hello, world", number )
    # if @send_message
    #   flash[:success] = "reminder sent"
    #   redirect_to tasks_path
    # else 
    #   flash[:error] = "Something went wrong..."
    #   render :get_phone_number
    # end
  end

end
