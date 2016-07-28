require 'rubygems'
require 'twilio-ruby'

class TextsController < ApplicationController

  #needs to be given its own model
  class TwilioAPI
    attr_reader :client

    ACCOUNT_SID = ENV['ACC_SID']
    AUTH_TOKEN = ENV['AUTH_TOKEN']
    TWILIO_PHONE = ENV['TWILIO_PHONE']
    MY_PHONE = ENV['MY_PHONE']

    Twilio.configure do |config|
      config.account_sid = ACCOUNT_SID
      config.auth_token = AUTH_TOKEN
    end

    def initialize
      @client = Twilio::REST::Client.new
    end

  end

  def send_text
    flash[:success] = "Text message sent."
    @twilio = TwilioAPI.new
    @twilio.client.messages.create(
      from: "#{TwilioAPI::TWILIO_PHONE}",
      to: "#{TwilioAPI::MY_PHONE}",
      body: "From CJ and Chris's Task Twilio app"
    )
    if flash[:success] = "Text message sent."
      redirect_to tasks_path
    end
  end
end
