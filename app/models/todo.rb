class Todo < ActiveRecord::Base
  def sms_info(event, note, timedate)
    account_sid = ENV['Actsid']
    auth_token = ENV['Authtoken']
    tnumber = ENV['Mytwilio']
    mnumber = ENV['MyPhone']
    client = Twilio::REST::Client.new account_sid, auth_token
    #return client
    client.messages.create(
      from: tnumber,
      to: mnumber,
      body: "ENV: #{event}, NOTE: #{note}, DUETIME: #{timedate}"
    )
  end
  
end
