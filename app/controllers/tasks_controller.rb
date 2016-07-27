class TasksController < ApplicationController

  def index
    if params[:sort_order]
      @tasks = Task.order(priority: params[:sort_order])
    else
      @tasks = Task.all
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(description_param)
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
    case
    when soft_delete_param['soft_delete']
      # Toggle soft_delete attribute.
      toggle_soft_delete
      redirect_to tasks_path
    when completed_param['completed_at']
      @task.update(completed_param)
      redirect_to tasks_path
    when @task.update(description_param)
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

    def description_param
      params.require("task").permit("description")
    end

    def completed_param
      params.require("task").permit("completed_at")
    end

    def soft_delete_param
      params.require("task").permit("soft_delete")
    end

    # def sort_param
    #   params.require("tasks").permit("sort_order")
    # end

    def toggle_soft_delete
      @task.toggle!(:soft_delete)
      msg = @task.soft_delete ? "Task has been soft deleted." : \
                                "Task has been undeleted." 
      flash[:success] = msg
    end
end
