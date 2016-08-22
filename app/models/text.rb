class Text

  attr_reader :client, :from_number
  def initialize
    # put your own credentials here
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    # and then you can create a new client without parameters
    if @client.account.incoming_phone_numbers.local.list.empty?
      @numbers = @client.available_phone_numbers.get('US').local.list(contains: '412')
      @from_number = @numbers[0].phone_number
      @client.incoming_phone_numbers.create(phone_number: @from_number)
    else
      @from_number = @client.account.incoming_phone_numbers.local.list[0].phone_number
    end
  end

  def send(to_number, msg)
    client.messages.create(
      from: from_number,
      to: to_number,
      body: msg
    )
  end

end