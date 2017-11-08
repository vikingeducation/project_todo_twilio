class TasksController < ApplicationController
  def index
    # @tasks = Task.all.order('completed_on DESC')
    @tasks = Task.completed_tasks.by_date
    @completed_points = Task.calculate_complete_points
    @total_points = Task.calculate_total_points
    @percent_complete = Task.calculate_percent_complete

  end

  def show
    @task = Task.find(params['id'])
  end

  def new
  end

  def edit
  end

end
