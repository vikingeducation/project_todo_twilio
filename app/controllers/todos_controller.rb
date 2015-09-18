class TodosController < ApplicationController
	before_action :set_todo, :except => [:index, :create]

	def index
		@todos = Todo.all.order(:due)
	end

	def show
	end

	def edit
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			flash[:success] = 'Todo created!'
			redirect_to @todo
		else
			flash.now[:error] = 'Error: todo not created'
			render :index
		end
	end

	def update
		if @todo.update_attributes(todo_params)
			flash[:success] = 'Todo updated!'
			redirect_to @todo
		else
			flash.now[:error] = 'Error: todo not updated'
			render :edit
		end
	end

	def destroy
		@todo.destroy
		flash[:success] = 'Todo deleted!'
		redirect_to todos_path
	end 

	private
		def set_todo
			@todo = Todo.find(params[:id])
		end

		def todo_params
			params.require(:todo).permit(:value, :due)
		end
end
