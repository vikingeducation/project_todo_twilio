class TextsController < ApplicationController
  #require "texter.rb"

  def send_text
    @todo = Todo.find(params[:id])

    texter = Texter.new
    response = texter.send_sms(@todo.task, @todo.due_date)

    if response
      flash[:success] = "SMS sent!"
    else
      flash[:danger] = "SMS failed to sen - please try again."
    end

    redirect_to todos_url
  end

end
