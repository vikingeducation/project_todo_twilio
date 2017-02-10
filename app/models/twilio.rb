require 'twilio-ruby'

class Texter

  def initialize(body, recipient=nil)
    account_sid = ENV['twilio_id']
    auth_token = ENV['twilio_token']
    @body = body
    @recipient = recipient || '+6593206320'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def create_message
    begin
      @client.messages.create(
        from: '+14058963612',
        to: @recipient,
        body: @body
      )
    rescue Twilio::REST::RequestError => e
      return false
    end

  end
end
