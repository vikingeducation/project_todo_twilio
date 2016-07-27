require 'twilio-ruby'

class TwilioApi
  attr_reader :client

  def initialize
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(message, to_phone)
  #   @client.messages.create(
  #   :from => "+13108505684",
  #   :to => to_phone,
  #   :body => message,
  #   :media_url => 'https://s-media-cache-ak0.pinimg.com/736x/51/aa/c8/51aac8e5328790194fc4220dfd88c1f7.jpg')

  begin

    client.messages.create({
      from: '+13108505684',
      to: to_phone,
      body: 'Hello world'
    })
  rescue Twilio::REST::RequestError => e
    puts e.message
  end
   end

end