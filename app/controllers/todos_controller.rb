class TodosController < ApplicationController

  def index  # combination of new and index
    @todos = Todo.sorted
    @todo = Todo.new
  end


  def create
    @todo = Todo.new(whitelisted_params)
    if @todo.save
      flash[:success] = "#{@todo.text} saved"
    else
      flash[:error] = "Failed to save #{@todo.text}"
    end
    redirect_to todos_path
  end








  def whitelisted_params
    params.require(:todo).permit(:text, :completion_date)
  end

end
