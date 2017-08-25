class TasksController < ApplicationController
  include TasksHelper
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelisted_parameters)
    if @task.save
      redirect_to task_path(@task)
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
