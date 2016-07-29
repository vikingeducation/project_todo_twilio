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
    @task = Task.new(good_params)
    @task.save
    render :show
  end

  def good_params
    params.require(:task).permit(:date, :description)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(good_params)
    render :show
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = Task.all
    render :index
  end
end
