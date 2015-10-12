require 'twilio-ruby'

class SMS

  def initialize
    account_sid = ENV["twilio_sid"]
    auth_token = ENV["twilio_token"]

    @client = Twilio::REST::Client.new account_sid, auth_token
  end


  def send_message(description, due)
    begin @client.messages.create(
      from: '+19803133582',
      to: '+17044938352',
      body: "Task Due: #{due}\n#{description}",
      )
      {status: "success", message: "Text Sent!"}
    rescue
      {status: "danger", message: "There was an issue sending the text!"}
    end
  end

end