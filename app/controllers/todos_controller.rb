class TodosController < ApplicationController
  def index
    @todos = Todo.new(retrieve_todos).todo_list
  end

  def new
  end

  private

  def retrieve_todos
    cookies[:todo_list]
  end
end
