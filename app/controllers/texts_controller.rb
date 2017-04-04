require File.expand_path('../../models/twilio.rb', __FILE__)
class TextsController < ApplicationController
  def send_text
    @text = Task.find(params[:id])
    text = "Task: #{@text.title}. Due: #{@text.deadline}"
    sms = Texter.new(text)
    if sms.create_message
      flash[:success] = "The task \"#{@text.title}\" was sent to your number"
    else
      flash[:error] = "Sorry! We couldn't send the task out"
    end
    redirect_to tasks_path
  end
end
