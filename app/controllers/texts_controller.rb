class TextsController < ApplicationController
  require "texter.rb"

  def send_text
    @todo = Todo.find(params[:id])

    texter = Texter.new
    texter.send_sms(@todo.task, @todo.due_date)

    flash[:success] = "SMS sent!"

    redirect_to :back
  end

end
