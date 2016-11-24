class TextsController < ApplicationController

  def create
    task = Task.find(params[:task_id])
    text = Tuhwilio.new
    begin
      text.sms(task.title)
    rescue
      flash[:error] = "Unable to send text message!"
      redirect_to root_path
    else
      flash[:success] = "A text has been sent to your 📞"
      redirect_to root_path
    end
  end

end
