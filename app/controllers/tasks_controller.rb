class TasksController < ApplicationController

	def index
		@tasks = Task.order(:time_to_be_completed => :asc)
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
		@task = Task.new
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create
		@task = Task.new(white_listed_params)
		@task.save
		flash[:message] = "Task created!"
		render 'show'
	
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		redirect_to root_path
	end

	def update
		@task = Task.find(params[:id])
		@task.update_attributes(white_listed_params) 

		redirect_to root_path
	end
end


private

	def white_listed_params
		params.require(:task).permit(:task, :description, :time_to_be_completed)
	end