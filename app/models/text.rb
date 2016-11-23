class Text

  def initialize task
    @description = task.description
    account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text
    @client.messages.create(
      from: '+14159341234',
      to: '+16105557069',
      body: 'Hey there!'
    )
  end

end
