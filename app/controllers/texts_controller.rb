# require '../models/twilio.rb'
class TextsController < ApplicationController
  def send_text
    task = Task.find(params[:task_id])
    @tclient = TwilioClient.new
    if @tclient.send_sms(task.description)
      flash[:success] = "Text has been sent!"
    else
      flash[:alert] = "Text was not sent!"
    end
    redirect_to tasks_path
  end
end
