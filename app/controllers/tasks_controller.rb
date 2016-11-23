class TasksController < ApplicationController

  def index
    @new_task = Task.new
    @tasks = Task.order(:due)
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def create
    Task.new(strong_params).save
    redirect_to tasks_url
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    @task.destroy
    redirect_to tasks_url
  end

  def edit
    @task = Task.find_by_id(params[:id])
  end

  def update
    @task = Task.find_by_id(params[:id])
    @task.update_attributes(strong_params)
    redirect_to tasks_url
  end

  private
  def strong_params
    params.require(:task).permit(:due, :description)
  end

end
