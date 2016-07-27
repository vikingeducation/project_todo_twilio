class TextsController < ApplicationController

  def send_text
    title = params[:title]
    description = params[:description]
    completion_date = params[:completion_date]
    text = create_text(title, description, completion_date)
    texter = Texter.new(text)
    texter.send_text
    redirect_to root_path
  end

  private 
  def create_text(title, description, completion_date)
    "Reminder: #{title}: #{description} is due on #{completion_date}."
  end

end
