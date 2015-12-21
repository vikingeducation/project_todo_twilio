require 'json'

class TodosController < ApplicationController
  def index
    todos = Todo.new(retrieve_todos)
    @todo_list = todos.todo_list
  end

  def create
    todos = Todo.new(retrieve_todos, retrieve_last_id)

    description = params[:description]
    due = params[:due]
    todo_list = todos.insert_todo(description, due)

    save_todos(todo_list)

    flash[:notice] = "Successfully added '#{description}'!"
    redirect_to todos_url
  end

  private

  def retrieve_todos
    if cookies[:todo_list]
      JSON.parse(cookies[:todo_list])
    else
      []
    end
  end

  def retrieve_last_id
    if cookies[:last_id]
      JSON.parse(cookies[:last_id])
    else
      0
    end
  end

  def save_todos(todo_list)
    cookies.permanent[:todo_list] = todo_list.to_json
  end
end
