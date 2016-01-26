class SMSHandler
  attr_accessor :client

  def initialize(api_id, token)
    @client = Twilio::REST::Client.new(api_id, token)
  end

  def send_text(from, to, body)
    @client.messages.create(
      from: from,
      to: to,
      body: body
      )
  end
end