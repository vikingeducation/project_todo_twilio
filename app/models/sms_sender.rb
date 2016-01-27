require 'twilio-ruby'
require 'figaro'

class SMSSender

  def initialize
    Figaro.application = Figaro::Application.new( {
    environment: "production",
    path:"./config/application.yml"} )
    Figaro.load

    acct_sid = Figaro.env.twilio_sid
    acct_token = Figaro.env.twilio_api_key
    @twilio_phone = Figaro.env.twilio_phone
    @my_phone = Figaro.env.my_phone
    @client = Twilio::REST::Client.new( acct_sid, acct_token )

  end

  def send_sms(message)

    @client.messages.create(
      :from => @twilio_phone,
      :to => @my_phone,
      :body => message )
  end

end
