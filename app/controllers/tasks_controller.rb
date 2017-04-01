class TasksController < ApplicationController

  def index
    @tasks = Task.order(:required_completion_date => :asc)
  end

  def show
    @task = Task.find(params[:id])
  end

end
