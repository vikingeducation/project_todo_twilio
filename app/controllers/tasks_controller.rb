class TasksController < ApplicationController

  def index
    @task = Task.order(:completion_date => :desc).all
  end

end
