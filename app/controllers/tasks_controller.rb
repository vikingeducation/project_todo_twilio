class TasksController < ApplicationController

  def index
    @tasks = Task.all.sort_by { |task| task.due_date }
    @attributes = Task.attribute_names
  end

  def show
    @task = Task.find(params[:id])    
    @attributes = Task.attribute_names
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:category, :description, :due_date)
    end

end



