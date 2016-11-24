class TextsController < ApplicationController

  def send_text
    task = Task.find_by_id(params[:id])
    if Text.new(task).send_text
      flash[:success] = "Message sent!"
    else
      flash[:error] = "Oops! Somethin' goofed!"
    end
    redirect_to root_url
  end

end
