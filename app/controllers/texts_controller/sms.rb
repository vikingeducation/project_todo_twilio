require 'twilio-ruby'

class TextsController::SMS
	attr_reader :error, :number

	def initialize(options={})
		@from = options[:from]
		@id = options[:id]
		@token = options[:token]
		@verified = options[:verified]
		@api = options[:api] || build_api
	end

	def send(to, message)
		success = valid_number?(to)
		success = verified?(to) if success
		success = do_send(to, message) if success
		success
	end

	def verified?(number)
		p self
		puts "+#{strip(number)} == +#{strip(@verified)}"
		is_verified = ("+#{strip(number)}" == "+#{strip(@verified)}")
		@error = 'Number is not verified' unless is_verified
		is_verified
	end

	def valid_number?(number)
		length = strip(number).length
		is_valid = (length == 10 || length == 11)
		@error = 'Number is not valid' unless is_valid
		is_valid
	end

	private
		def do_send(to, message)
			to = strip(to)
			sent = false
			begin
				@api.account.messages.create(
					:from => @from,
					:to => to,
					:body => message
				)
				sent = true
			rescue Twilio::REST::RequestError => e
				@error = e.to_s
			end
			sent
		end

		def strip(number)
			number.to_s.gsub(/[^0-9]/, '')
		end

		def build_api
			Twilio::REST::Client.new(@id, @token)
		end
end