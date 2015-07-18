class TextsController < ApplicationController
  def send_text
    todo = Todo.find(params[:id])
    sms_body = todo.goal + todo.completion_date.to_s
    account_sid = ENV["TWILIO_SID"]
    auth_token  = ENV["TWILIO_AUTH"]
    from_number = ENV["TWILIO_NUMBER"] #+2345678912
    user = User.find_by_id(params[:user_id])
    to_number   = user.number
    begin
        client = Twilio::REST::Client.new account_sid, auth_token
        client.account.messages.create(
          :from => from_number,
          :to =>   to_number,
          :body => sms_body
        )
    rescue Twilio::REST::RequestError => e
        puts e.message
    end
    flash[:notice] = "Text message sent!"
    redirect_to user
  end
end