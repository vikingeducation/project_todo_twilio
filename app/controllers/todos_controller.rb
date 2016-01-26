class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
    @sorted_todos = @todos.sort_by(&:due_date)
  end

  def create
    @todo = Todo.new(whitelisted_params)
    @todo.save
    redirect_to todo_path(@todo)
  end

  def show
    @todo = Todo.find(params[:id])
  end

  private

  def whitelisted_params
    params.require(:todo).permit(:description, :due_date)
  end
end
