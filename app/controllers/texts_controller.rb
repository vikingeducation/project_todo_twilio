# require '../models/twilio.rb'
class TextsController < ApplicationController
  def send_text
    @tclient = TwilioClient.new
    @tclient.send_sms(params[:task_description])
    redirect_to tasks_path
  end
end
