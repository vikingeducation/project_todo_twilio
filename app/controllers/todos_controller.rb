class TodosController < ApplicationController

  def index
    @todos = Todo.order('due_date IS NULL, due_date ASC')
    @todo = Todo.new
  end


  def create
    @todo = Todo.new(whitelisted_params)

    if @todo.save
      flash[:success] = "New task created!"
      redirect_to todos_path
    else
      flash.now[:danger] = "Failed to add task to list - please try again."
      render todos_path
    end
  end


  def destroy
    @todo = Todo.find(params[:id]).destroy!
    flash[:warning] = "Task deleted."
    redirect_to todos_path
  end


  def edit
    @todo = Todo.find(params[:id])
  end


  def update
    @todo = Todo.find(params[:id])

    if @todo.update(whitelisted_params)
      flash[:success] = "Task updated!"
      redirect_to todos_path
    else
      flash.now[:danger] = "Failed to edit task - please try again."
      render :edit
    end
  end


  def complete
    @todo = Todo.find(params[:id])

    if @todo.update(whitelisted_complete)
      flash[:success] = "Task completed!"
      redirect_to todos_path
    else
      flash.now[:warning] = "Failed to mark as complete - please try again."
      render todos_path
    end

  end



  private

  def whitelisted_params
    params.require(:todo).permit(:task, :due_date, :completion_date)
  end

#  def whitelisted_complete
#    params.require(:todo).permit()
#  end


end
