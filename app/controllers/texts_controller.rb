class TextsController < ApplicationController

  def send_text
    text = create_text(params)
    texter = Texter.new(text)
    texter.send_text
    redirect_to root_path
  end

  private 
  def create_text(params)
    title = params[:title]
    description = params[:description]
    completion_date = params[:completion_date]
    "Reminder: #{title}: #{description} is due on #{completion_date}."
  end

end
