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

  private

  def get_params
    params.require(:task).permit(:title, :deadline, :description)
  end
end
