class TextsController < ApplicationController

  def send_text
    @task = Task.find_by_id(params[:id])

    if TwilioText.new.send_text( @task.description )
      flash[:success] = "Reminder Sent!"
    else
      flash[:error] = "Error: " + @task.errors.full_messages.join(', ')
    end
    redirect_to root_path
  end
end
