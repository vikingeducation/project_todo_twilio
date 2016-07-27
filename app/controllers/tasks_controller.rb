class TasksController < ApplicationController

  def index
    case params[:sort_order]
    when 'asc', 'desc'
      @tasks = Task.order(priority: params[:sort_order])
    when 'created_at'
      @tasks = Task.order(:created_at)
    when 'category'
      @tasks = Task.order(:category)
    else
      @tasks = Task.all
    end
    @stickies = Task.sticky(true)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task created."
      redirect_to @task
    else
      flash[:danger] = "Invalid input."
      redirect_to new_task_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    toggle_sticky if params['task']['sticky']      
    toggle_soft_delete if params['task']['soft_delete']
    if @task.update(task_params)
      flash[:success] = "Task updated."
      redirect_to tasks_path
    else
      flash[:danger] = "Invalid input."
      redirect_to edit_task_path(@task)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task deleted."
    redirect_to tasks_path
  end

  private

    def task_params
      params.require('task').permit('description',
                                    'completed_at',
                                    'category')
    end

    def toggle_soft_delete
      @task.toggle!(:soft_delete)
      msg = @task.soft_delete ? "Task has been soft deleted." : \
                                "Task has been undeleted." 
      flash[:success] = msg
    end

    def toggle_sticky
      @task.toggle!(:sticky)
      msg = @task.sticky ? "Task has been stickied" : \
                             "Task has been unstickied." 
      flash[:success] = msg
    end
end
