class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.order(rating: :desc)
    #@tasks.sort_by{|task| task.completion_date}
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task #{@task.title} was created"
      redirect_to task_path(@task)
    else
      flash.now[:error] = "Task was not created, need longer description (4 chars min)"
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if params[:task][:soft_delete]
      flash[:success] = "Task #{@task.title} was soft deleted"
    else
      flash[:success] = "Task #{@task.title} was updated"
    end
      redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task #{@task.title} was destroyed waaa waaaaa"
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :description,:completion_date, :soft_delete_flag, :rating)
  end
end
