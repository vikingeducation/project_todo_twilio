class TasksController < ApplicationController
  def index
    @tasks = Task.order(:due_date)
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
      flash[:success] = "Your task was successfully saved!"
      redirect_to @task
    else
      flash.now[:notice] = "Your task had errors. Please correct them and try again."
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date)
  end
end
