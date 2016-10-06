class TasksController < ApplicationController

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelisted_task_params)
    if @task.save
      flash.notice = "Task #{@task.description} Created!"
      redirect_to task_path(@task)
    else
      flash.notice = "Boo! We couldn't create #{@task.description} because it had errors!"
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    Task.find(params[:id]).destroy
    flash.notice = "Task #{@task.description} Deleted!"
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(whitelisted_task_params)
    if @task.save
      flash.notice = "Task #{@task.description} Updated!"
      redirect_to task_path(@task)
    else
      flash.notice = "Boo! We couldn't update #{@task.description} because it had errors!"
      render :new
    end
  end

  private

  def whitelisted_task_params
    params.require(:task).permit(:description, :complete_by)
  end

end
