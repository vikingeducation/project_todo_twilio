class TextsController < ApplicationController
  def send_text
    @send_message = TwilioApi.new.send_message( "Hello, world", "+17322991948" )
  end
end
