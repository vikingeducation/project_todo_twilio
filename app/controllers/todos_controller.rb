class TodosController < ApplicationController

  def index
    @todos = Todo.order(:completion_date => 'DESC')
    @new_task = Todo.new
  end


  def create
    @todo = Todo.new(whitelisted_params)

    if @todo.save
      # success flash
      redirect_to todos_path
    else
      # fail flash.now
      render todos_path
    end
  end


  def destroy
    @todo = Todo.find(params[:id]).destroy!
    # flash success
    redirect_to todos_path
  end


  private

  def whitelisted_params
    params.require(:todo).permit(:task)
  end


end
