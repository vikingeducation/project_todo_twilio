class TasksController < ApplicationController
    
    def index
      @tasks = Task.order(deadline: :desc)
    end
    
end
