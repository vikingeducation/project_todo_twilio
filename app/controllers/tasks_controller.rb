class TasksController < ApplicationController

  def index
    @tasks = Task.order(:complete_by_date => :desc)
  end


  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(whitelisted_task_params)
    if @task.save
      flash[:success] = "You've successfully created a new task!"
      redirect_to task_path(@task)
    else
      flash[:error] = "Sorry, unable to create your task"
      render 'new'
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task successfully destroyed!"
    redirect_to tasks_path(@tasks)
  end


  def edit
    @task = Task.find(params[:id])
  end


  def update
    @task = Task.find(params[:id])
    @task.update(whitelisted_task_params)
    flash[:success] = "Task successfully updated!"
    redirect_to task_path(@task)
  end


  def soft_delete
    @task = Task.find(params[:id])
    @task.soft_delete = true
    @task.save
    redirect_to 'index'
  end


  private

  def whitelisted_task_params
    params.require(:task).permit(:complete_by_date, :description, :soft_delete)
  end

end
