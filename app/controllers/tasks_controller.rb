class TasksController < ApplicationController

  def index
    @tasks = Task.order(:completion_date => :desc)
  end
end
