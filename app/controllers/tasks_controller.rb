class TasksController < ApplicationController
  

  def index
    @tasks = Task.all.sort_by(&:date)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelisted_params)
    if @task.save
      redirect_to task_path(@task.id)
      flash[:success] = "your post was successfully created"
    else
      flash[:error] = "description must be at least 4 characters"
      redirect_to new_task_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @article.destroy
      flash[:success] = "task was successfully destroyed"
      redirect_to tasks_path
    else
      flash[:error] = "there was a problem destroying the task"
      redirect_to new_task_path
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(whitelisted_params)
      flash[:success] = "task was successfully updated"
      redirect_to task_path(@task.id)
    else
      flash[:error] = "something went wrong updating the task"
      redirect_to edit_task_path(@task.id)
    end
  end

  def whitelisted_params
    params.require(:task).permit(:description, :date)
  end
end
