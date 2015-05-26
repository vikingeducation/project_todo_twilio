class TodosController < ApplicationController
	def index
		create_todos
	end

	def create
		create_todos
		@todos << {:id => next_id(@todos), :text => params[:text], :completion_date => params["completion_date"]}
		session[:todos] = @todos.to_json
		redirect_to todos_path
	end

	def destroy
		create_todos
		delete_todo(params[:id])
		session[:todos] = @todos.to_json
		redirect_to todos_path
	end
	
private
	# Creates the todos instance variable from the session if available.
	# Otherwise creates a blank session[:todos]
	def create_todos
		if !session[:todos] || session[:todos].empty?
			session[:todos] = []
			@todos = []
		else
			@todos = JSON.parse session[:todos]
		end
	end

	# Get the next ID for our ToDo's
	def next_id(todos)
		# If there are no todos presently then return 1
		return 1 if todos.empty?
		max_id = 0
		todos.each do |todo|
			max_id = (todo["id"] > max_id ? todo["id"] : max_id)
		end
		max_id + 1
	end

	def delete_todo(id)
		@todos.delete_if do |todo|
			todo["id"].to_s == id
		end
	end
end
