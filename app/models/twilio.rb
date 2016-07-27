require 'rubygems'
require 'twilio-ruby'

class Caller

  p AUTH_TOKEN = ENV['AUTH_TOKEN']
  p SID = ENV['SID']

  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new SID, AUTH_TOKEN
  end

  def send_message(from, to, title, description, deadline)
    message = title << "\n" << description << "\n" << deadline
    client.messages.create(from: from, to: to, body: message)
  end

end

