class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @total_task_count = Task.all.count
    @incomplete_tasks = Task.incomplete_tasks.by_date
    @complete_tasks = Task.completed_tasks.by_date

    @completed_points = Task.calculate_complete_points
    @total_points = Task.calculate_total_points

    @percent_incomplete = Task.calculate_percent_incomplete
    @percent_complete = Task.calculate_percent_complete

    @current_velocity = Task.calculate_current_velocity
    @remaining_days = Task.calculate_remaining_days
    @projected_completion_date = Task.calculate_completion_date

  end

  def show
    # @task = Task.find(params['id'])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash.notice = "Hooray! '#{@task.name}' has been added to the docket!"
      redirect_to tasks_url
    else
      flash.now.alert = 'Uh oh! Something went wrong...'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash.notice = "Hooray! '#{@task.name}' has been updated!"
      redirect_to tasks_url
    else
      flash.now.alert = 'Uh oh! Something went wrong...'
      render :new
    end
  end

  def destroy
    @task.delete
    flash.notice = "As you wish. '#{@task.name}' has been deleted."
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :point_value, :completed_on, :category_id)
  end

  def set_task
    @task = Task.find(params['id'])
  end

end
