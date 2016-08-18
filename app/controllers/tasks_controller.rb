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
    new_task = Task.new(whitelist_params)
    if new_task.save
      flash[:success] = "yeah, new task created!"
      redirect_to task_path(new_task)
    else
      flash.now[:danger] = "Something wrong!"
      render :new
    end
  end

  private
    def whitelist_params
      params.require(:task).permit(:title, :description, :due_date)
    end
end
