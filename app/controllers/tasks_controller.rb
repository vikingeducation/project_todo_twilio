class TasksController < ApplicationController

  def index
    @task = Task.order(:completion_date => :asc).all
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

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(whitelisted_params)

    redirect_to task_path
  end


  private

  def whitelisted_params
    params.require(:task).permit(:description, :completion_date)
  end

end
