class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id)
    else
      flash.now[:error] = "description must be longer than 4 characters"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if Task.update(params[:id], task_params)
      redirect_to task_path(@task.id)
    else
      flash.now[:error] = "description must be longer than 4 characters"
      render :edit
    end
  end


  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.delete
      redirect_to tasks_path
    else
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completion_date)
  end
end
