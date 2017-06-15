class TasksController < ApplicationController
  def index
    @tasks = Task.order(:due_date)
  end

  def show
    @task = Task.find(params[:id])
  end
end
