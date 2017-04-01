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
    redirect_to @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :required_completion_date)
  end

end
