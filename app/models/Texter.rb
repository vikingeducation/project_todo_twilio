require 'twilio-ruby'
require_relative 'env'

class Texter

# account_sid = TWILIO_SID
# auth_token = TWILIO_SECRET

def initialize(text)
  @client = Twilio::REST::Client.new "AC736c03bafc1edfe06f96e7df1e23e83d", "b9a609612a1a8b2ea3001a8392800520"
  @body = text
end

def send_text
  @client.messages.create(
    from: '+16367353249',
    to: "+16362931540",
    body: @body
    )
    # puts message.sid
end

end
