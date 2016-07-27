require 'twilioapi'

class TextsController < ApplicationController
  def send_text
    @task = Task.find(params[:task_id])
    send_reminder(@task)

    redirect_to @task
  end

  private

  def send_reminder(task)
    client = TwilioAPI.new
    client.text("Reminder!\n#{task.description} due at #{task.due_date.in_time_zone("Pacific Time (US & Canada)").to_s(:rfc822)}")
  end
end
