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
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@tasks)
  end


  def edit
    @task = Task.find(params[:id])
  end


  def update
    @task = Task.find(params[:id])
    @task.update(whitelisted_task_params)
    redirect_to task_path(@task)
  end


  private

  def whitelisted_task_params
    params.require(:task).permit(:complete_by_date, :description)
  end

end
