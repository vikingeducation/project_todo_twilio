class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def edit
    #
  end

  def update
    #
  end

  def new
    @task = Task.new
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task created!"
      redirect_to @task
    else
      flash[:error] = "Try again son!"
    end
  end

  private

  def task_params
    params.require(:task).permit(:due, :additional, :description)
  end

end
