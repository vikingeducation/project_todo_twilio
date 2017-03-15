class TasksController < ApplicationController

  def index
    @task = Task.order(:completion_date => :desc).all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelisted_params)
    @task.save

    render :show
  end


  private

  def whitelisted_params
    params.require(:task).permit(:description, :completion_date)
  end

end
