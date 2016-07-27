require 'twilio-ruby'
require '~/Desktop/env.rb'

class Texter

account_sid = TWILIO_SID
auth_token = TWILIO_SECRET
phone_to = PHONE
phone_from = PHONE_FROM

def initialize(text)
  @client = Twilio::REST::Client.new account_sid, auth_token
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
