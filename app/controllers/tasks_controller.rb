class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.order(deadline: :asc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(get_params)
    
    if @task.save
      flash[:success] = "New task created!"
      redirect_to @task
    else
      flash.now[:error] = "Task could not be created!"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = "Task deleted!"
    else
      flash[:error] = "Task could not be deleted! Try again."
    end
    redirect_to tasks_path
  end

  private

  def get_params
    params.require(:task).permit(:title, :deadline, :description)
  end
end
