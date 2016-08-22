class TextsController < ApplicationController
  def send_text
    @task = Task.find(params[:id])
    message = "Title:#{@task.title},
               Description:#{@task.description},
               Due_date:#{@task.due_date}"
    text_new = Text.new
    if text_new.send(ENV["MY_PHONE_NUMBER"], message)
      flash[:success] = "Message sent"
    else
      flash[:danger] = "Message not send"
    end
    redirect_to tasks_path
  end
end
