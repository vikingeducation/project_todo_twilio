class TasksController < ApplicationController

  include ApplicationHelper

  def index
    @tasks = Task.order(:completion_date => :desc).all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_form_params)
    if @task.save
      redirect_to task_path(@task)
      flash.notice = "'#{@task.title}' created!"
    else
      render :show
      flash.notice = "Task not created!"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.delete
      redirect_to tasks_path
      flash.notice = "'#{@task.title}' deleted!"
    else
      render :show
      flash.notice = "Task not deleted!"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_form_params)
      flash.notice = "'#{@task.title}' updated!"
      redirect_to task_path(@task)
    else
      flash.notice = "Task not updated!"
      render :show
    end
  end
end