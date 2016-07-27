class TasksController < ApplicationController

  def index
    @tasks = Task.order(deadline: :asc)
  end

end
