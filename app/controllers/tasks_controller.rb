class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    if params[:sort] == "Rating"
      @tasks = Task.order(rating: :desc)
    else
      @tasks = Task.order(deadline: :asc)
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(get_params)
    
    if @task.save
      flash[:Success] = "New task created!"
      redirect_to @task
    else
      flash.now[:Error] = "Task could not be created!"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:Success] = "Task deleted!"
    else
      flash[:Error] = "Task could not be deleted! Try again."
    end
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(get_params)
      flash[:Success] = "Task updated!"
      redirect_to @task
    else
      flash.now[:Error] = "Task could not be updated! Try again."
      render tasks_path#edit_task_path(@task)
    end
    
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete = !@task.complete

    @task.save

    redirect_to tasks_path
  end

  private

  def get_params
    params.require(:task).permit(:title, :deadline, :description, :rating)
  end
end

