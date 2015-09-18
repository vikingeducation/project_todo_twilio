class TodosController < ApplicationController
	before_action :set_todo, :except => [:index]

	def index
		@todos = Todo.all
	end

	private
		def set_todo
			@todo = Todo.find(params[:id])
		end

		def todo_params
			params.require(:todo).permit(:value, :due)
		end
end
