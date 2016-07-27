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
      flash[:success] = "Task Saved!"
      redirect_to task_path(@task)
    else
      flash[:alert] = "Task Not Saved!"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    flash[:alert] = "Unable to destroy task" unless @task.destroy
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(whitelisted_task_params)
      flash[:success] = "Task Updated!"
      redirect_to task_path(@task)
    else
      flash[:alert] = "Task Not Updated!"
      render :edit
    end
  end

  private

  def whitelisted_task_params
    params.require(:task).permit(:date, :description)
  end
end
