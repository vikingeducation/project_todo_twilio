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
    @task = Task.new(whitelist_params)
    if @task.save
      redirect_to @task
    else
      #error message
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to root_path
  end

  private

  def whitelist_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
