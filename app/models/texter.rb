class Texter

  def initialize
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end


  def send_sms(task, due_date)
    date = due_date.to_date
    days_from_today = days_until(date)

    message = "#{task}.. due #{days_from_today} (#{date})."

    @client.messages.create(
      from: '+17818503538',
      to: '+17813674722',
      body: message
    )
  end


  private


  def days_until(due_date)
    in_words = ""

    day_difference = (due_date - Date.today).to_i

    pluralized_days = ActionController::Base.helpers.pluralize(day_difference.abs, 'day')

    if day_difference > 0
      in_words = "in #{pluralized_days}"
    elsif day_difference < 0
      in_words = "#{pluralized_days} ago"
    else
      in_words = "today"
    end

    in_words

  end

end