class PostsController < ApplicationController

	def index
		@tasks = Task.all
	end
end
