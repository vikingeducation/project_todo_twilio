class TasksController < ApplicationController

  def index
    @task = Task.new
    @tasks = Task.order(:due)
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def create
    Task.new(strong_params).save
    redirect_to tasks_url
  end

  def strong_params
    params.require(:task).permit(:due, :description)
  end

end
