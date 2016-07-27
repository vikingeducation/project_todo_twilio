class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @tasks = @tasks.sort_by{ |task| task.complete_date }
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
      flash[:notice] = "Task successfully created"
      redirect_to @task
    else
      flash.now[:error] = "Task was not created"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task succesfully destroyed"
    else
      flash[:error] = "Task was not deleted"
    end
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task succesfully updated"
      redirect_to @task
    else
      flash.now[:notice] = "Task was not updated"
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:id])
    mark_complete
    flash[:notice] = "Task marked as completed"
    redirect_to root_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :complete_date)
    end

    def mark_complete
      @task.completed = true
      @task.save
    end
end
