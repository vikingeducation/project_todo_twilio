class TasksController < ApplicationController

    def index
      @tasks = Task.order(created_at: :desc)
    end

    def show
      @task = Task.find(params[:id])
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(white_listed_params)
      if @task.save
        flash[:success] = "New task was created!"
        redirect_to task_path(@task)
      else
        flash[:danger] = "The task couldn't be created!"
        render :new
      end
    end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to root_path
    end

    def edit
      @task = Task.find(params[:id])
    end

    def update
      @task = Task.find(params[:id])
      if @task.update_attributes(white_listed_params)
        redirect_to task_path(@task)
      else
        render :edit
      end
    end

    private
    def white_listed_params
      params.require(:task).permit(:title, :description, :deadline)
    end

end
