class TextsController < ApplicationController
  def reminder
    @task = Task.find(params[:id])
    message = "#{@task.title}: #{@task.description} is due on #{@task.complete_date}"
    TwilioReminder.new.send_message(message)
    flash[:notice] = "Reminder was texted to you"
    redirect_to root_path
  end
  
end
