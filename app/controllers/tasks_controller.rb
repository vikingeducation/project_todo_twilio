class TasksController < ApplicationController

  def index
    @tasks = Task.order(:completion_date => :desc)
    flash[:success] = "Welcome to the Task Index Page"
  end

  def show
    @task = Task.find(params[:id])
    flash[:success] = "Welcome to the Task Show Page"
  end


  def new
    @task = Task.new
    flash[:success] = "Welcome to the Task Create Page"
  end

  def create
    @task = Task.new(white_listed_params)
    if @task.save
      flash[:success] = "Your task has been created."
      redirect_to @task
    else
      flash[:warning] = "Your task did was not saved properly."
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    flash[:success] = "Welcome to the Task Edit Page"
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(white_listed_params)
      flash[:success] = "Your task has been updated."
      redirect_to @task
    else
      flash[:warning] = "Your task was not properly updated."
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Welcome to the Task Delete Page"
      redirect_to tasks_path
  end

  private
  def white_listed_params
    params.require(:task).permit(:title, :description, :completion_date)
  end
end
