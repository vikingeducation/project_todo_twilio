class TextsController < ApplicationController

  def send_text
    task = params[:task]
    due = params[:due]

    text = Text.new
    text.send_message(task, due)

    flash[:notice] = "Message sent!"
    redirect_to todos_url
  end
end
