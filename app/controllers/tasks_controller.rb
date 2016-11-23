class TasksController < ApplicationController
 # TODO Add before hook?

  def index
    @tasks = sorted_tasks
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = "Task Saved"
      redirect_to @task
    else
      flash.now[:error] = "Error: " + @task.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @task = Task.find_by_id(params[:id])
  end

  def update
    @task = Task.find_by_id(params[:id])

    if @task.update( task_params )
      flash[:success] = "Task Edited"
      redirect_to @task
    else
      flash.now[:error] = "Error: " + @task.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    if @task
      @task.delete
      flash[:success] = "Task Deleted"
      redirect_to root_path
    else
      flash.now[:error] = "Error: " + @task.errors.full_messages.join(', ')
      render :index
    end
  end

  private
  def task_params
    params.require(:task).permit(:description, :completion_date)
  end

  def sorted_tasks
    Task.all.sort_by { |task| task.completion_date }
  end

end
