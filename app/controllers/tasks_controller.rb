class TasksController < ApplicationController
  include TasksHelper

  def index
    @tasks = Task.order(:completion_date)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(whitelisted_task_params)
    if @task.valid?
      flash[:success] = "Task '#{@task.name}' Created!"
      redirect_to task_path(@task.id)
    else
      flash[:error] = @task.errors.full_messages
      redirect_to new_task_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(whitelisted_task_params)
      flash[:success] = "Task '#{@task.name}' Updated!"
      redirect_to task_path(@task.id)
    else
      flash[:error] = @task.errors.full_messages
      redirect_to edit_task_path(@task.id)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    flash[:success] = "Task '#{@task.name}' Deleted!"
    redirect_to tasks_path
  end
end
