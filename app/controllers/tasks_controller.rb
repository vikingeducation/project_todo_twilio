class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Your task as been created!"
      redirect_to task_path(@task.id)
    else
      flash.now[:error] = "description must be longer than 4 characters"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Your task as been updated!"
      redirect_to task_path(@task.id)
    else
      flash.now[:error] = "description must be longer than 4 characters"
      render :edit
    end
  end


  def index
    params[:order_by] = "sort_description" unless params[:order_by]
    sort_method = params[:order_by].to_sym
     @tasks = Task.send(sort_method)
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.delete
      flash[:success] = "Your task as been destroyed!"
      redirect_to tasks_path
    else
      flash.now[:error] = "Something went wrong. Your task was not destroyed. :("
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :completion_date, :crossed_out, :priority, :sticky)
  end
end
