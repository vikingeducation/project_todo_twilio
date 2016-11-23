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
      flash[:success] = "Task saved."
      redirect_to @task
    else
      render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completion_date)
  end
end
