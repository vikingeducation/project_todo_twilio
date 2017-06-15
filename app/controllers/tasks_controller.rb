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
      flash.now[:error] = "Your task had errors. Please correct them and try again."
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = "Your task was successfully deleted!"
      redirect_to tasks_path
    else
      flash.now[:error] = "There was an error deleting your task."
      render :show
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Your task was successfully updated!"
      redirect_to @task
    else
      flash[:error] = "There was an error updating your task."
      render :show
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date)
  end
end
