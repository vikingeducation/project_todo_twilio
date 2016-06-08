class TasksController < ApplicationController

    def index
      @tasks = Task.order(deadline: :desc)
    end

    def show
      @task = Task.find(params[:id])
    end

end
