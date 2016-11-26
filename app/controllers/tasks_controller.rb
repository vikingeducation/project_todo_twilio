class TasksController < ApplicationController

  def index
    @tasks = Task.list(params[:order])
  end

  def show
    @task = Task.find(params[:id])
    check_enabled
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task saved."
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :root
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "Task updated!"
      redirect_to @task
    else
      render 'edit'
    end
  end

  def update_single
    @task = Task.find(params[:id])
    @task.update_attribute(params[:attribute], params[:value])
    redirect_to :root
  end

  private

  def task_params
    params.require(:task).permit(:description, :completion_date, :tag_list)
  end

  def check_enabled
    if @task.disabled
      flash[:danger] = "Task is disabled."
      redirect_to :root
    end
  end
end
