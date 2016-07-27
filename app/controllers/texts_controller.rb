require 'rubygems'
require 'twilio-ruby'

class TextsController < ApplicationController

  #needs to be given its own model
  class TwilioAPI
    attr_reader :client

    ACCOUNT_SID = ENV['ACC_SID']
    AUTH_TOKEN = ENV['AUTH_TOKEN']

    Twilio.configure do |config|
      config.account_sid = ACCOUNT_SID
      config.auth_token = AUTH_TOKEN
    end

    def initialize
      @client = Twilio::REST::Client.new
    end

  end

  def send_text
    @twilio = self.class::TwilioAPI.new
    raise
    # @client.messages.create(
    #   from: '+14159341234',
    #   to: '+16105557069',
    #   body: 'Hey there!'
    # )
  end
end
