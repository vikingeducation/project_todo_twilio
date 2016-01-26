class TextsController

  def send_message
    sms = SMSSender.new
    sms.send_sms(params[:text])
    redirect_to todos_path
  end

end
