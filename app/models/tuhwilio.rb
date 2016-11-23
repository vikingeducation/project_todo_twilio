class Tuhwilio

  AUTH_TOKEN = ENV['TWILIO']
  SID = ENV['TWILIO_SID']

  def initialize
    @client = Twilio::REST::Client.new SID, AUTH_TOKEN
  end

  def sms(message)
    @client.messages.create(
      from: '+15109076355',
      to: '+15109905172',
      body: message
    )
  end

end
