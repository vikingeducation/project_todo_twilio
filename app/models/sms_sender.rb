require 'twilio-ruby'

class SmsSender

  CLIENT = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_auth_token']

  FROM = ENV['twilio_phone_number']
  TO = ENV['my_phone_number']

  def self.send_message(body=nil)
    return false unless body
    CLIENT.account.messages.create(
      :from => FROM,
      :to => TO,
      :body => body
    )
    true
  end
end
