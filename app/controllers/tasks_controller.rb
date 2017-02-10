class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Your task has been created"
      redirect_to task_path(@task)
    else
      flash.now[:error] = "Your task she be at least 4 characters long"
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Your task has been updated"
      redirect_to task_path(@task)
    else
      flas[:error] = "Your task was not updated"
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end
