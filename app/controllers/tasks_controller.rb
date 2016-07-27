class TasksController < ApplicationController
  def index
    @tasks = Task.all.order('due_date DESC')
  end
end
