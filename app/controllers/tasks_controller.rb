class TasksController < ApplicationController
  include TasksHelper
  def index
    # @tasks = Task.all.sort_by {|t| t.due_date}  BASIC
    @tasks = Task.order(:due_date)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelisted_parameters)
    if @task.save
      flash[:message] = "New task successfully added."
      redirect_to task_path(@task)
    else
      flash[:message] = "Task must be longer than 4 characters!"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(whitelisted_parameters)
    flash[:message] = "Task successfully updated."
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:message] = "Task deleted successfully."
    redirect_to tasks_path
  end
end
