class TextsController < ApplicationController
	def new
		@message = text_params[:message]
	end

	def create
		build_sms
		to = params[:to]
		@message = params[:message]
		if @sms.send(to, @message)
			flash[:success] = 'Message sent!'
			redirect_to todos_path
		else
			flash.now[:error] = @sms.error
			render :new
		end
	end

	private
		def text_params
			params.permit(:to, :message)
		end

		def build_sms
			secrets = Rails.application.secrets
			from = secrets.twilio_number.to_s
			verified = secrets.twilio_verified.to_s
			id = secrets.twilio_id
			token = secrets.twilio_token
			@sms = SMS.new(
				:from => from,
				:id => id,
				:token => token,
				:verified => verified
			)
		end
end

require_relative 'texts_controller/sms.rb'
