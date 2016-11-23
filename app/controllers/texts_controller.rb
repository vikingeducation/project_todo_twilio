class TextsController < ApplicationController

  def send_text
    Text.new(Task.first).send_text
  end

end
