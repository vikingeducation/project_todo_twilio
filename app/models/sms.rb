class SMS

  def send_sms(from, to, msg)

  # put your own credentials here
  account_sid = Rails.application.secrets.twilio_account_sid
  auth_token = Rails.application.secrets.twilio_api_token

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => from,
    :to => to,
    :body => msg,
  })

  end

end