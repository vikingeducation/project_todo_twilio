class TodosController < ApplicationController
	def index
		@todos = Todo.new(session[:todos])
	end

	def create
		@todos = Todo.new(session[:todos])
		flash_info = @todos.create_todo(params)
		flash[flash_info[:type]] = flash_info[:message]
		save_session
		redirect_to todos_path
	end

	def destroy
		@todos = Todo.new(session[:todos])
		@todos.delete_todo(params[:id])
		save_session
		flash[:info] = "ToDo Deleted!"
		redirect_to todos_path
	end
	
	def edit
		@todos = Todo.new(session[:todos])
		@current_todo = @todos.all_todos.select { |todo| todo['id'].to_i == params['id'].to_i }[0]
	end

	def update
		@todos = Todo.new(session[:todos])
		# Find the index of the todo which matches params['id'] and replaces it
		todo_index = @todos.all_todos.find_index{ |todo| todo['id'].to_i == params['id'].to_i }
		@todos.update_todo(todo_index, params)
		save_session
		flash[:success] = "ToDo Updated!"
		redirect_to todos_path
	end

private
	# This needs to be in the controller since the model doesn't have 
	# access to the session.
	# Save the session as a JSON object
	def save_session
		session[:todos] = @todos.all_todos.to_json
	end
end
