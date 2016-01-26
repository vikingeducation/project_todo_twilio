Figaro.application = Figaro::Application.new(
  environment: "development",
  path: "config/application.yml"
)
Figaro.load


Twilio.configure do |config|
  config.account_sid = Figaro.env.twilio_sid
  config.auth_token = Figaro.env.twilio_auth_token
end


class TwilioAPI

  attr_accessor :client

  def initialize
    @client = Twilio::REST::Client.new
  end


end