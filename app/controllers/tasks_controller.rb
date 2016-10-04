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
  		redirect_to @task
  	else
      flash[:notice] = "Something went wrong!"
  		render :new
  	end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash.now[:notice] = "You have deleted your task"
    redirect_to root_url
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to @task
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)	
  end
end
