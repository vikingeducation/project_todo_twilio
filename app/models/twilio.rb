require 'rubygems'
require 'twilio-ruby'

class TwilioAPI
  attr_reader :client

  ACCOUNT_SID = ENV['ACC_SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']

  Twilio.configure do |config|
    config.account_sid = account_sid
    config.auth_token = auth_token
  end

  def initialize
    @client = Twilio::REST::Client.new
  end

end