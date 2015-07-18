class TextsController < ApplicationController
  def send_text
    todo = Todo.find(params[:id])
    sms_body = todo.goal + todo.completion_date.to_s
    account_sid = ENV["TWILIO_SID"]
    auth_token  = ENV["TWILIO_AUTH"]
    from_number = ENV["TWILIO_NUMBER"] #+2345678912
    to_number   = ENV["SELF_NUMBER"]
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
    redirect_to todos_path
  end
end