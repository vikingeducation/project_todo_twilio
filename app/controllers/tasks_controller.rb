require 'date'
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
    @task = Task.new(whitelisted_task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    flash[:alert] = "Unable to destroy task" unless @task.destroy
    redirect_to tasks_path
  end


  private

  def whitelisted_task_params
    params.require(:task).permit(:date, :description)
  end
end
