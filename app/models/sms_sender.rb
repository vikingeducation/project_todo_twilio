require 'twilio-ruby'

account_sid = ENV['twilio_sid']
auth_token = ENV['twilio_auth_token']
CLIENT = Twilio::REST::Client.new account_sid, auth_token

FROM = ENV['twilio_phone_number']
TO = ENV['my_phone_number']

def send_message(body=nil)
  return false unless body
  CLIENT.account.messages.create(
    :from => FROM,
    :to => TO,
    :body => body
  )
  true
end
