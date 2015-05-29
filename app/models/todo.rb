class Todo < ActiveRecord::Base
	# This will act as the model since we're not using a DB
	def initialize(saved_info)
		@todos_session = saved_info
		initiate_session
	end

	# Creates the todos instance variable from the session if available.
	# Otherwise creates a blank session[:todos]
	def initiate_session
		if @todos_session.empty?
			@todos = []
		else
			@todos = JSON.parse @todos_session
		end
	end

	def create_todo(params)
		if !params[:text].empty? && !params[:completion_date].empty?
			@todos << {:id => next_id(@todos), :text => params[:text], :completion_date => params[:completion_date]}
			return {:type => :success, :message => "ToDo Created!"}
		else
			return {:type => :alert, :message => error_message(params)}
		end
	end

	def update_todo(todo_index, params)
		 @todos[todo_index] = {:id => params[:id], :text => params[:text], :completion_date => params["completion_date"]}
	end

	def delete_todo(id)
		@todos.delete_if do |todo|
			todo["id"].to_s == id
		end
	end

private

	# Get the next ID for our ToDo's
	def next_id(todos)
		# If there are no todos presently then return 1
		return 1 if @todos.empty?
		max_id = 0
		todos.each do |todo|
			max_id = (todo["id"].to_i > max_id ? todo["id"].to_i : max_id)
		end
		max_id + 1
	end

	def error_message(params)
		if params[:text].empty? && params[:completion_date].empty?
			"Oops! You didn't fill anything out!"
		elsif params[:text].empty?
			"Please enter some text for your todo!"
		else
			"Please enter a completion date!"
		end
	end

	def all_todos
		@todos
	end
end
