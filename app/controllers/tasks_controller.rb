class TasksController < ApplicationController

	def index
		@tasks = Task.order(:completion)
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(tasks_params)
		if @task.save
			flash[:success] = "Task created successfully"
			redirect_to task_path(@task.id)
		else
			flash[:error] = "Task creation failed"
			redirect_to new_task_path
		end
	end

	def destroy
		@task = Task.find(params[:id])
		if @task.destroy
			flash[:success] = "Great! Your task has been removed!"
			redirect_to tasks_path
		else
			flash[:error] = "Could not remove task!"
		end
  	end

	def edit
		@task = Task.find(params[:id])
	end

  	def update
		@task = Task.find(params[:id])
		if @task.update(tasks_params)
			flash[:success] = "Great! Your task has been updated!"
			redirect_to task_path(@task.id)
		else
			flash[:error] = "Could not update!"
		end
	end

	def tasks_params
    	params.require(:task).permit(:name, :description, :completion)
  	end

end

