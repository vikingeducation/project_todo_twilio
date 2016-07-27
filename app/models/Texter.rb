require 'twilio-ruby'

class Texter

account_sid = 
auth_token = 

def initialize(text)
  @client = Twilio::REST::Client.new account_sid, auth_token
  @body = text
end

def send_text
  @client.messages.create(
    from:       ,
    to:         ,
    body: @body
    )
end

end