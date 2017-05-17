class TasksController < ApplicationController

  def index
    @tasks = Task.order(:completion_date => :desc)
  end

  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(white_listed_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(white_listed_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
      redirect_to tasks_path
  end

  private
  def white_listed_params
    params.require(:task).permit(:title, :description, :completion_date)
  end
end
