class TasksController < ApplicationController
  def index
    # @tasks = Task.all.order('completed_on DESC')
    @incomplete_tasks = Task.incomplete_tasks.by_date
    @complete_tasks = Task.completed_tasks.by_date

    @completed_points = Task.calculate_complete_points
    @total_points = Task.calculate_total_points

    @percent_incomplete = Task.calculate_percent_incomplete
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
