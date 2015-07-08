class Texter
  require 'twilio-ruby'

  def initialize
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end


  def send_sms
    @client.messages.create(
      from: '+17818503538',
      to: '+17813674722',
      body: 'Testing...'
    )
  end

end