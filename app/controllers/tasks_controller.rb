class TasksController < ApplicationController

  def index
    @tasks = Task.order(:deadline => :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Created!"
      redirect_to @task
    else
      flash.now[:failure] = "Failed to create"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "Deleted!"
      redirect_to tasks_path
    else
      flash.now[:failure] = "Failed to delete!"
      render @task
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Updated!"
      redirect_to @task
    else
      flash.now[:failure] = "Failed to update!"
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :deadline)
  end

end