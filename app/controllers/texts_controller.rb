class TextsController < ApplicationController

  def send_text
    @client.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)



    
  end
end
