class TasksController < ApplicationController

  def index
    @tasks = Task.order(deadline: :asc)
  end

  def show
    @task = Task.find(params[:id])
  end

end
