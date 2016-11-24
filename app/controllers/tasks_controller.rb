class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def edit
    @task = Task.find_by_id(params[:id])
  end

  def update
    @task = Task.find_by_id(params[:id])
    if @task.update(task_params)
      flash[:success] = "Edit saved!"
      redirect_to @task
    else
      flash.now[:error] = "Try again son!"
      render "edit"
    end
  end

  def new
    @task = Task.new
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    if @task.soft_delete
      @task.destroy
      flash[:success] = "We nuked it dawg!"
    else
      @task.update_attribute(:soft_delete, true)
    end
    redirect_to tasks_path
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task created!"
      redirect_to @task
    else
      flash.now[:error] = "Try again son!"
      render "new"
    end
  end

  private

  def task_params
    params.require(:task).permit(:due, :additional, :description, :rating)
  end

end
