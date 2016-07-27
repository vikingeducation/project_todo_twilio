require "../../env"
require 'rubygems'
require 'twilio-ruby'

class TwilioClient

  def initialize
    config
    @client = Twilio::REST::Client.new
  end

  def config
    Twilio.configure do |config|
      config.account_sid = SID
      config.auth_token = TOKEN
    end
  end

# send an SMS
  def send_sms(body)
    @client.account.messages.create({
      from: "#{TWILIONUM}",
      to: "#{PHONE}",
      body: "#{body}"
    })
  end

end
