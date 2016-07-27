class TextsController < ApplicationController
  
  def send_text
    texter = Texter.new(params[:title])
    texter.send_text
  end

end
