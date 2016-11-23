require 'twilio-ruby'

class TwilioText

  def initialize
    load_figaro
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new ENV['twilio_acct_sid'], ENV['twilio_auth_token']
  end

  def load_figaro
    Figaro.application = Figaro::Application.new(
    path: File.expand_path("../../../config/application.yml")
    )
    Figaro.load
  end

  def send_message(msg)
    @client.messages.create(
      from: ENV["twilio_number"], # '+17208097538'
      to: ENV["my_number"],
      body: msg
    )
  end

end
