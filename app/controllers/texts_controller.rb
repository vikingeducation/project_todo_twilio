class TextsController < ApplicationController

  def send_sms
    @twilio = TwilioClient.new
    @task = Task.find(params[:id])
    @twilio.send_sms(@task.description, @task.completion_date)
    flash.now[:success] = "Reminder sent."
    render Rails.application.routes.recognize_path(request.referer)[:action]
  end

end
