module SMS

  ACCOUNT_SID = ENV["twilio_account_sid"]
  AUTH_TOKEN = ENV["twilio_api_token"]

  def self.send_sms(from, to, msg)
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @client.account.messages.create({ :from => from, :to => to, :body => msg })
  end

end