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
    @task = Task.new(task_params)
    
    if @task.save
      flash[:notice] = "Task successfully created"
      redirect_to @task
    else 
      flash.now[:error] = "Task was not created"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task succesfully destroyed"
    else
      flash[:error] = "Task was not deleted"
    end
    redirect_to root_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :complete_date)
    end

end
