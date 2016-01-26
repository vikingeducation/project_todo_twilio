class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(whitelist_todo_params)
    if @todo.save
      flash[:success] = "Your task has been added!"
      redirect_to root_path
    else
      flash[:error] = "The input's can't be empty or input proper date!"
      redirect_to root_path
    end
  end

  private

  def whitelist_todo_params
    params.require(:todo).permit(:task, :date)
  end
end
