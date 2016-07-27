require 'twilio-ruby'

class Texter

 
def initialize(text) 
  @body = text
  account_sid = ENV["TWILIO_SID"]
  auth_token = ENV["TWILIO_TOKEN"]
  @client = Twilio::REST::Client.new account_sid, auth_token
end

def send_text
  @client.messages.create(
    from: ENV["TWILIO_PHONE"] ,
    to: ENV["MY_PHONE"],
    body: @body
    )
  
end

end
