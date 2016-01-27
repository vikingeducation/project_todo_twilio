require 'twilio-ruby'
require 'figaro'
require 'pry-byebug'

class TwilioSMS

  def initialize

    Figaro.application = Figaro::Application.new( {
     environment: "production",
     path:"./config/application.yml"} )
     Figaro.load
 

    sid = Figaro.env.twilio_api_sid
    secret = Figaro.env.twilio_api_secret
    @client = Twilio::REST::Client.new(sid, secret)
    @twilio_number = Figaro.env.twilio_number
  end

  def send_message(phone_number, alert_message)
    message = @client.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message
    )
    puts message.to
  end
end
