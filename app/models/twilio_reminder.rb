class TwilioReminder

  def initialize
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_auth
    @twi_num = Rails.application.secrets.twilio_num
    @my_num = Rails.application.secrets.my_num
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(body_text)
    @client.messages.create(
        from: @twi_num,
        to: @my_num,
        body: body_text
      )
  end

end
