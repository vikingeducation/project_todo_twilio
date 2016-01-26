class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
    @sorted_todos = @todos.sort_by(&:due_date)
  end

  def create
    @todo = Todo.new(whitelisted_params)
    @todo.save
    redirect_to todos_path
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end 

  private

  def whitelisted_params
    params.require(:todo).permit(:description, :due_date)
  end
end
