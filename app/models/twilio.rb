require 'twilio-ruby'

class Caller

  AUTH_TOKEN = ENV['AUTH_TOKEN']
  SID = ENV['SID']

  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new SID, AUTH_TOKEN
  end

  def send_message(from, to, title, description, deadline)
    message = title << "\n" << description << "\n" << deadline
    @client.messages.create(from: from, to: to, body: message)
  end

end

t = Caller.new
t.send_message("+19789870177", "+19789870177", "hey", "how's it going", "07/25/2016")