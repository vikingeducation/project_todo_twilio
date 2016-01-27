class TextsController < ApplicationController

  def create
    sms = SMSSender.new
    if sms.send_sms(params[:text])
       flash[:notice] = "Message sent!."
    else
       flash[:alert] = "Unable to send SMS!"
    end   
    redirect_to todos_path
  end

end
