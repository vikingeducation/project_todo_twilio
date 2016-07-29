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
    if @task.save
      flash[:success] = "Your article has been created!"
      render :show
    else
      flash[:error] = "Fix your error!"
      render :new
    end
  end

  def good_params
    params.require(:task).permit(:date, :description)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(good_params)
      flash.now[:success] = "Your article has been updated!"
      render :show
    else
      flash.now[:error] = "Fix your error!"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = Task.all
    flash[:success] = "The article has been deleted"
    render :index
  end
end
