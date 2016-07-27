class TwilioAPI
  attr_reader :client

  def initialize
    # put your own credentials here
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    # alternatively, you can preconfigure the client like so
    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end

    # and then you can create a new client without parameters
    @client = Twilio::REST::Client.new
  end

  def text(message)
    @client.messages.create(
      from: '15093591086',
      to: '15092709717',
      body: message
      )
  end
end
