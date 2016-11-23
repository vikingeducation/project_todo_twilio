require 'twilio-ruby'

class Twilio

  ACCOUNT_SID = ENV['TWILIO_SID']
  AUTH_TOKEN  = ENV['TWILIO_TOKEN']
  FROM_NUM    = ENV['FROM_NUM']
  TO_NUM      = ENV['TO_NUM']

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send_sms(description, completion_date)
    @client.messages.create(
      from: FROM_NUM,
      to: TO_NUM,
      body: format_body(description, completion_date)
    )
  end

  private

  def format_body(description, completion_date)
    result = "Don't forget: #{description}" 
    result += "Finish by: #{completion_date.strftime("%B %d")}"
  end

end
