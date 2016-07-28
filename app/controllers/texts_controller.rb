require_relative "../models/twilio.rb"

class TextsController < ApplicationController

  def send_text
    @task = Task.find(params[:id])
    t = Caller.new
    t.send_message("+19785281841", "+19789870177", @task.title, @task.description, @task.deadline.to_s)
    flash[:Success] = "Reminder sent!"
    redirect_to tasks_path
  end

end
