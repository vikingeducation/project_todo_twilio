class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :require_admin

  def index
    @task_set = TaskSet.new(Task.all)
  end

  def new
    @task = Task.new
    respond_to :js
  end

  def create
    @task = Task.new(task_params)
    @task.save
    flash.notice = "Hooray! '#{@task.name}' has been added to the docket!"
    respond_to :js
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
    params.require(:task).permit(:name, :point_value, :started_on, :completed_on, :paused, :favorite, :lesson_number, :category_id, :description, :url)
  end

  def set_task
    @task = Task.find(params['id'])
  end

end
