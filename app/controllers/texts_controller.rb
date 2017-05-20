class TextsController < ApplicationController

	require 'twilio-ruby'
	def send_text
		account_sid = ENV["ID"]
		auth_token = ENV["API_KEY"]

		#@client = Twilio::REST::Client.new account_sid, auth_token

	end
end
