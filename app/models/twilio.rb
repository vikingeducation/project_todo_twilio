class Twilio

  def initialize
    load_figaro
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new ENV['twilio_acct_sid'], ENV['twilio_auth_token']
  end

  def load_figaro
    Figaro.application = Figaro::Application.new(
    path: File.expand_path("../../../config/application.yml")
    )
    Figaro.load

    p "---------------------------------"
    p ENV['twilio_acct_sid']
    p "---------------------------------"
  end

  def send_message
    @client.messages.create(
      from: '+17208097538',
      to: '+17202811487',
      body: 'Hey there!'
    )
  end
end
