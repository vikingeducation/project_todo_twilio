class TextsController < ApplicationController

  def create
    sms = SMSSender.new
    sms.send_sms(params[:text])
    redirect_to todos_path
  end

end
