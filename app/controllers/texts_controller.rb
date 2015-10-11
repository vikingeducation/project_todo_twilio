class TextsController < ApplicationController

  def send_text
    todo = Todo.find(params[:id])
    formated_due = todo.due.strftime("%m-%d-%Y")
    text = SMS.new.send_message(todo.description, formated_due)

    flash[text[:status]] = text[:message]
    redirect_to todos_path
  end

end
