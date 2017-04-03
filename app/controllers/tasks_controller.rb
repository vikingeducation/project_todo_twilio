class TasksController < ApplicationController

  def index
    @tasks = Task.order(:required_completion_date => :asc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    flash[:success] = "Your task was created successfully"
    redirect_to @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :required_completion_date)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Your task was deleted successfully"
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:success] = "Your task was updated successfully"
    redirect_to @task
  end

end
