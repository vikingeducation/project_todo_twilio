class TasksController < ApplicationController

  def index
    @task = Task.order(:completion_date => :desc).all
  end

  def show
    @task = Task.find(params[:id])
  end

end
