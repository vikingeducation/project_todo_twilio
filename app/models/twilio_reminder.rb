require 'rubygems'

class TwilioReminder 
  include Twilio

  def initialize
    account_sid = 'ACef3b85a5d2d920e965c579dcde995bf9'.to_s
    auth_token = '9869d7680565ef8fed50e9cc72c0ec68'.to_s

    @client = Twilio::Rest::Client.new account_sid, auth_token
  end

  def send_message(body_text)
    @client.messages.create(
        from:  +'17088872392',
        to: +'13127148287',
        body:  body_text.to_s
        )
  end




end