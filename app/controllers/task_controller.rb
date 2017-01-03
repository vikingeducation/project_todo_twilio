class TaskController < ApplicationController

  def index
    @tasks = Task.order(:deadline => :desc)
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

    redirect_to @task
  end

  private

  def task_params
    params.require(:task).permit(:description, :deadline)
  end

end