require 'json'

class TodosController < ApplicationController
  def index
    todos = Todo.new(retrieve_todos, retrieve_last_id)
    @todo_list = todos.todo_list
  end

  def create
    todos = Todo.new(retrieve_todos, retrieve_last_id)

    description = params[:description]
    due = params[:due]
    todo_list = todos.insert_todo(description, due)

    save_todos(todo_list, todos.last_id)

    flash[:notice] = "Successfully added '#{description}'!"
    redirect_to todos_url
  end

  def destroy
    todos = Todo.new(retrieve_todos, retrieve_last_id)

    todo_list = todos.remove_todo(params[:id].to_i)
    save_todos(todo_list, todos.last_id)

    flash[:notice] = "Successfully deleted!"
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
    cookies[:last_id].to_i
  end

  def save_todos(todo_list, last_id)
    cookies.permanent[:todo_list] = todo_list.to_json
    cookies.permanent[:last_id] = last_id
  end
end
