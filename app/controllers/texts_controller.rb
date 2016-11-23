class TextsController < ApplicationController

  def send_text
    task = Task.find_by_id(params[:id])
    if Text.new(task).send_text
      flash.now[:success] = "Message sent!"
    else
      flash.now[:error] = "Oops! Somethin' goofed!"
    end
    render "index"
  end

end
