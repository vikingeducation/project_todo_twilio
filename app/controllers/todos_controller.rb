class TodosController < ApplicationController

  def index
    @todos = Todo.order('due_date IS NULL, due_date ASC')
    @todo = Todo.new
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


  def edit
    @todo = Todo.find(params[:id])
  end


  def update
    @todo = Todo.find(params[:id])

    if @todo.update(whitelisted_params)
      # success flash
      redirect_to todos_path
    else
      # fail flash.now
      render :edit
    end
  end



  private

  def whitelisted_params
    params.require(:todo).permit(:task, :due_date)
  end


end
