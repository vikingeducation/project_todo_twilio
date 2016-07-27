class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @tasks.sort_by {|task| task[:completion_date] }
  end

  def show
    @task = Task.find_by(params[:id])
  end
end
