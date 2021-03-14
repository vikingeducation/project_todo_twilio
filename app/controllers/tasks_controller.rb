class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :set_task_set, only: [:index, :create, :update, :destroy]
  before_action :require_admin

  def index
  end

  def new
    @task = Task.new
    respond_to :js
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # flash.notice = "Hooray! '#{@task.name}' has been added to the docket!"
    respond_to :js
  end

  def edit
    respond_to :js
  end

  def update
    @task.update(task_params)
    respond_to :js
  end

  def destroy
    @task.delete
    # flash.notice = "As you wish. '#{@task.name}' has been deleted."
    respond_to :js
  end

  private

  def task_params
    params.require(:task).permit(:name, :point_value, :started_on, :completed_on, :paused, :favorite, :lesson_number, :category_id, :description, :url)
  end

  def set_task
    @task = Task.find(params['id'])
  end

  def set_task_set
    @task_set = TaskSet.new(Task.all)
  end
end
