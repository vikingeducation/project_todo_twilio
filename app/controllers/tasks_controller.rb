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
    flash.notice = "Task '#{@task.name}' Created!"
    redirect_to task_path(@task.id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(whitelisted_task_params)
    flash.notice = "Task '#{@task.name}' Updated!"
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    flash.notice = "Task '#{@task.name}' Deleted!"
    redirect_to tasks_path
  end
end
