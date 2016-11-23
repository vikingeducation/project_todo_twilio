class TasksController < ApplicationController

  def index
    @tasks = sorted_tasks
  end

  def show

  end

  private

  def sorted_tasks
    Task.all.sort_by { |task| task.completion_date }
  end

end
