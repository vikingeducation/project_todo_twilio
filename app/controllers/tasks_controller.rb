class TasksController < ApplicationController

  def index
    @tasks = Task.all.order('due_date ASC')
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
      flash[:success] = "New task created."
      redirect_to @task
    else
      flash.now[:error] = "Oops!"
      render new_task_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "Boom!"
    else
      flash[:error] = "Er...."
    end
      redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
      flash[:success] = "You updated the task."
    else
      flash.now[:error] = "Try again."
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :due_date, :priority, :category)
  end
end
