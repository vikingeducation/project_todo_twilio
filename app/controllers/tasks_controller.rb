class TasksController < ApplicationController

  def index
    @tasks = Task.order(:required_completion_date => :asc)
  end

end
