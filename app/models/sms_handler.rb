class SMSHandler
  attr_accessor :client

  Figaro.application = Figaro::Application.new(
    environment: "production",
    path: "config/application.yml"
  )
  Figaro.load

  API_ID = Figaro.env.API_ID
  TOKEN = Figaro.env.TOKEN
  NUMBER = Figaro.env.NUMBER
  MY_NUMBER = Figaro.env.MY_NUMBER

  def initialize
    @client = Twilio::REST::Client.new(API_ID, TOKEN)
  end

  def send_text(body)
    @client.messages.create(
      from: NUMBER,
      to: MY_NUMBER,
      body: body
      )
  end
end