class TasksController < ApplicationController

  def index
    @tasks = Task.order(:due)
  end

end
