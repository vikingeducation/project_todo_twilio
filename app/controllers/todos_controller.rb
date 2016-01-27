class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
    @sorted_todos = @todos.sort_by(&:due_date)
  end

  def create
    @todo = Todo.new(whitelisted_params)
    if @todo.save
      redirect_to todos_path
      flash[:success] = "Task created"
    else
      render 'index'
      flash.now[:error] = "Create failed"
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      redirect_to todos_path
      flash[:success] = "Task deleted"
    else
      render 'index'
      flash.now[:error] = "Delete failed"
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(whitelisted_params)
      redirect_to todos_path
      flash[:success] = "Task updated"
    else
      render 'edit'
      flash.now[:error] = "Update failed"
    end
  end

  private

  def whitelisted_params
    params.require(:todo).permit(:description, :due_date)
  end
end
