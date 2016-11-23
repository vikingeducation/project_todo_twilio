class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
    else
      flash[:error] = "Try again son!"
    end
  end

  private

  def task_params
    params.require(:task).permit(:due, :additional, :description)
  end

end
