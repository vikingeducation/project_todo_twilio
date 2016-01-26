class TextsController < ApplicationController

  def send_text
    byebug
    
    @handler = SMSHandler.new(API_ID, TOKEN)
    if @handler.send_text(NUMBER, MY_NUMBER, desc)
      flash[:success] = "Text sent"
      redirect_to todos_path
    else
      flash.now[:error] = "Text failed to send"
      render todos_path
    end
  end
end