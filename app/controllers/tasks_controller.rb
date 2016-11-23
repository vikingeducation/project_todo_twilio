class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelist_params)
    if @task.save
      flash[:success] = "Task created!"
      redirect_to @task
    else
      flash.now[:error] = "Unable to save!"
      render 'new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task deleted!"
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(whitelist_params)
      flash[:success] = "Your task has been updated!"
      redirect_to @task
    else
      flash.now[:error] = "There were problems with your update!"
      render 'edit'
    end
  end

  private

  def whitelist_params
    params.require(:task).permit(:title, :description, :due_date, :complete)
  end
end
