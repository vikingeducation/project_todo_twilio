class TasksController < ApplicationController

	include TasksHelper

	def index

		@tasks = Task.all

	end

	def new

	end


	def show

		@task = Task.find( params[ :id ] )

	end


	def create

		@task = Task.new( task_params )

		if @task.save

   		flash.notice = "Task Created!"

			redirect_to task_path( @task )

		else

			render 'new'

		end

	end

	def edit

		@task = Task.find( params[ :id ] )

	end

	def update

		@task = Task.find( params[ :id ] )
		@task.update( task_params )

   flash.notice = "Task Updated!"

		redirect_to tasks_path

	end

	def destroy

		@task = Task.find( params[ :id ] )

		@task.destroy

   flash.notice = "Task Deleted!"

		redirect_to tasks_path

	end


end
