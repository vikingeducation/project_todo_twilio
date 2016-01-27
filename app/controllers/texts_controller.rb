Figaro.application = Figaro::Application.new(
  environment: "development",
  path: "config/application.yml"
)
Figaro.load


class TextsController < ApplicationController

  def send_text
    @client = TwilioAPI.new.client
    if @client.messages.create(
        from: Figaro.env.sandbox_number,
        to: Figaro.env.to_number,
        body: "To Do: #{params[:todo][:text]}, Due Date: #{params[:todo][:completion_date]}"
        )
      flash[:success] = "Text reminder has been sent."
    else
      flash[:error] = "Unable to send text reminder."
    end
    redirect_to todos_path
  end

end