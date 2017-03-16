class TasksController < ApplicationController

  def index
    @tasks = Task.order(:completion_date => :asc).all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelisted_params)
    if @task.save
      flash[:success] = "You have successfully created task"
      render :show
    else
      flash.now[:error] = "Something went wrong, you didn't create the task!"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "You have successfully deleted task"
      redirect_to root_path
    else
      flash.now[:error] = "Something went wrong, you didn't delete the task!"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(whitelisted_params)
      flash[:success] = "You have successfully edited task"
      redirect_to task_path
    else
      flash.now[:error] = "Something went wrong, your edit wasn't successful!"
      render :edit
    end
  end


  private

  def whitelisted_params
    params.require(:task).permit(:description, :completion_date)
  end

end
