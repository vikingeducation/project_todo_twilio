class TodosController < ApplicationController

  def index  # combination of new, edit and index
    @todos = Todo.sorted
    @todo = Todo.new
  end


  def create
    @todo = Todo.new(whitelisted_params)
    if @todo.save
      flash[:success] = "#{@todo.id} saved"
    else
      flash[:danger] = "Failed to save #{@todo.id}"
    end
    redirect_to todos_path
  end


  def update
    @todo = Todo.find(params[:id])
    if @todo.update(whitelisted_params)
      flash[:success] = "#{@todo.id} saved"
    else
      flash[:danger] = "Failed to save #{@todo.id}"
    end
    redirect_to todos_path
  end


  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:success] = "#{@todo.id} deleted"
    else
      flash[:danger] = "Failed to delete #{@todo.id}"
    end
    redirect_to todos_path
  end

  def complete_task
    @todo = Todo.find(params[:id])
    if @todo.update(:complete => true)
      flash[:success] = "#{@todo.id} Completed"
    else
      flash[:danger] = "Failed to complete #{@todo.id}"
    end
    redirect_to todos_path
  end





  def whitelisted_params
    params.require(:todo).permit(:text, :completion_date, :complete)
  end

end
