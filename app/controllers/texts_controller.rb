class TextsController < ApplicationController

  def send_text
    @client = TwilioAPI.new.client
    @client.messages.create(
      from: '+14155992671',
      to: '+14153287835',
      body: "To Do: #{params[:todo][:text]}, Due Date: #{params[:todo][:completion_date]}"
      )
    redirect_to todos_path
  end

end