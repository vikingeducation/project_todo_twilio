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

		redirect_to @task

	end


end
