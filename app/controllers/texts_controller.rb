class TextsController < ApplicationController

  def send_text
    @handler = SMSHandler.new
    if @handler.send_text(params[:desc])
      flash[:success] = "Text sent"
      redirect_to todos_path
    else
      flash.now[:error] = "Text failed to send"
      render todos_path
    end
  end
end