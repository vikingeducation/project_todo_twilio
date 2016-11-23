class Text

  def initialize(task)
    @description = task.description
    @due_date = task.due
    account_sid = ENV['ID_KEY']
    auth_token = ENV['TOKEN_KEY']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text
    @client.messages.create(
      from: ENV['FROM_KEY'],
      to: ENV['TO_KEY'],
      body: "Task: #{@description}, is due: #{@due_date}"
    )
  end

end
