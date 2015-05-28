class TodosController < ApplicationController
	def index
		create_todos
	end

	def create
		create_todos
		if !params[:text].empty? && !params[:completion_date].empty?
			@todos << {:id => next_id(@todos), :text => params[:text], :completion_date => params[:completion_date]}
			save_session(@todos)
			flash[:success] = "ToDo Created!"
		else
			flash[:alert] = error_message
		end
		redirect_to todos_path
	end

	def destroy
		create_todos
		delete_todo(params[:id])
		save_session(@todos)
		flash[:info] = "ToDo Deleted!"
		redirect_to todos_path
	end
	
	def edit
		create_todos
		@current_todo = @todos.select { |todo| todo['id'].to_i == params['id'].to_i }[0]
	end

	def update
		create_todos
		# Find the index of the todo which matches params['id'] and replaces it
		todo_index = @todos.find_index{ |todo| todo['id'].to_i == params['id'].to_i }
		@todos[todo_index] = {:id => params[:id], :text => params[:text], :completion_date => params["completion_date"]}
		save_session(@todos)
		flash[:success] = "ToDo Updated!"
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

	# Save the session as a JSON object
	def save_session(todos)
		session[:todos] = todos.to_json
	end

	# Get the next ID for our ToDo's
	def next_id(todos)
		# If there are no todos presently then return 1
		return 1 if todos.empty?
		max_id = 0
		todos.each do |todo|
			max_id = (todo["id"].to_i > max_id ? todo["id"].to_i : max_id)
		end
		max_id + 1
	end

	def delete_todo(id)
		@todos.delete_if do |todo|
			todo["id"].to_s == id
		end
	end

	def error_message
		if params[:text].empty? && params[:completion_date].empty?
			"Oops! You didn't fill anything out!"
		elsif params[:text].empty?
			"Please enter some text for your todo!"
		else
			"Please enter a completion date!"
		end
	end
end
