class TextsController < ApplicationController
	# Texts controller. Get here by clicking the 'Send Reminder' button on the 
	# todos index. This sets up the Twilio object and only has one method, 
	# send_message to send that reminder to someone. 
	
	def initialize
		# Twilio Credentials
		account_sid = 'ACfd7e82f9c00c87c4c02e63c6e5f53be9'
		auth_token = '273797e4cebe09cbf3b4984c82594ce2'
		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token
	end

	def send_message
		text = params[:text]
		date = params[:date]
		begin
			@client.messages.create(
			  from: '+13152075237',
			  to: '+13157232056',
			  body: "Hey there!
			  		ToDo: #{text}
			  		Complete By:	#{date}"
			)
		rescue Exception => e
			flash[:alert] = e.message
		else
			flash[:success] = "Message Sent!"
		end	
		redirect_to todos_path
	end
end
