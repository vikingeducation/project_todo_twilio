require 'twilio-ruby'

class Text

  def initialize
    account_sid = ENV['twilio_account_sid']
    auth_token = ENV['twilio_auth_token']
    @from_number = ENV['twilio_number']
    @to_number = ENV['my_number']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(task, due)
    @client.messages.create(
      from: @from_number,
      to: @to_number,
      body: "REMEMBER: #{task}, due #{due}"
    )
  end
end