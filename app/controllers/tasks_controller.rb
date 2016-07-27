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
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task created."
      redirect_to @task
    else
      flash[:danger] = "Invalid input."
      redirect_to new_task_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if soft_delete_param
      # Toggle soft_delete attribute.
      toggle_soft_delete
      redirect_to tasks_path
    elsif @task.update(task_params)
      flash[:success] = "Task updated."
      redirect_to @task
    else
      flash[:danger] = "Invalid input."
      redirect_to edit_task_path(params[:id])
    end

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task deleted."
    redirect_to tasks_path
  end

  private

    def task_params
      params.require("task").permit("description", "completed_at")
    end

    def soft_delete_param
      params.require("task").permit("soft_delete")
    end

    def toggle_soft_delete
      @task.toggle!(:soft_delete)
      msg = @task.soft_delete ? "Task has been soft deleted." : \
                                "Task has been undeleted." 
      flash[:success] = msg
    end
end
