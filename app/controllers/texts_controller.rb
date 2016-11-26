class TextsController < ApplicationController

  def send_sms
    @twilio = TwilioClient.new
    @task = Task.find(params[:id])
    @twilio.send_sms(@task.description, @task.completion_date)
    flash[:success] = "Reminder sent."
    redirect_to root_path
  end

end
