require 'twilio-ruby'

class Twilio

  def initialize
    
    Figaro.application = Figaro::Application.new( {
    environment: "development",
    path:"./config/application.yml"} )
    Figaro.load
    
    ACCT_SID = Figaro.env.twilio_sid
    AUTH_TOKEN = Figaro.env.twilio_api_key
    TWILIO_PHONE = Figaro.env.twilio_phone
TWILIO_PHONE = Figaro.env.twilio_phone
    @client = Twilio::REST::Client.new ACCT_SID, AUTH_TOKEN

  end

 def send_sms
friends = {
"+14153334444" => "Curious George",
"+14155557775" => "Boots",
"+14155551234" => "Virgil"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end
 end 
from = "+14159998888" # Your Twilio number
 


end

