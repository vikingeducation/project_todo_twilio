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

		redirect_to tasks_path

	end

	def destroy

		@task = Task.find( params[ :id ] )

		@task.destroy

		redirect_to tasks_path

	end


end
