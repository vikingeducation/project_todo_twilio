class TodosController < ApplicationController

  def index
    @todos = Todo.all.order(:date)
  end

  def create
    @todo = Todo.new(whitelist_todo_params)

    if @todo.save
      flash[:success] = "Your task has been added!"
    else
      flash[:error] = "The inputs can't be empty or input proper date!"
    end
     redirect_to root_path
  end

  def destroy
    @todo = Todo.find(params[:id])

    @todo.destroy
    flash[:success] = "Your task has been deleted!"
    redirect_to root_path
  end

  def edit
    @todo = Todo.find(params[:id])
  end


  def update
    @todo = Todo.find(params[:id])

    if @todo.update(whitelist_todo_params)
      flash[:success] = "Your task has been updated!"
      redirect_to root_path
    else
      flash[:error] = "The inputs can't be empty or input proper date!"
      redirect_to :back
    end
   

  end



  private

  def whitelist_todo_params
    params.require(:todo).permit(:task, :date)
  end
end
