class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(whitelisted_todo_params)
    if @todo.save
      redirect_to todo_path(@todo)
      flash[:notice] = "Task created!"
    else
      redirect_to new_todo_path
      flash[:alert] = "Sorry, we couldn't do that."
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def index
    @todos = Todo.order('date')
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update( whitelisted_todo_params )
      redirect_to todo_path(@todo)
      flash[:notice] = "Task updated!"
    else
      redirect_to edit_todo_path(@todo)
      flash[:alert] = "Sorry, we couldn't do that."
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:notice] = "Task Deleted!"
      redirect_to todos_path
    else
      flash[:alert] = "Sorry, we couldn't do that."
      redirect_to todo_path
    end
  end

  private

  def whitelisted_todo_params
    params.require(:todo).permit(:text,:date)
  end
end
