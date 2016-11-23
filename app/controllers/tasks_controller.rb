class TasksController < ApplicationController

  def index
    @tasks = Task.order(:due)
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

end
