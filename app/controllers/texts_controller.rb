class TextsController < ApplicationController

  def send_sms
    @twilio = Twilio.new
    @twilio.send_sms(params[:description], params[:completion_date])
    render Rails.application.routes.recognize_path(request.referer)[:action]
  end

end
