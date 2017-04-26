class TasksController < ApplicationController

  def index
    @tasks = Task.all.sort_by { |task| task.due_date }
    @attributes = Task.attribute_names
  end

  def show
    
  end
end
