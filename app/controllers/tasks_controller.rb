class TasksController < ApplicationController
  def index
    @tasks = Task.order(:due_date)
  end
end
