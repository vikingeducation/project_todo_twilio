class TasksController < ApplicationController
  include TasksHelper
  def index
    if params[:sort].nil?
      @tasks = Task.all.page(params[:page]).per(2)
    else
      sort = params[:sort]
      order = params[:order]
      @tasks = Task.all.order(sort.to_sym => order.to_sym)
    end
  end

  def new
    
    @task = Task.new
    @task = Task.new(1)
    @task = Task.new(31)
    @task = Task.new('test')
    
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params['id'])
  end

  def edit
    @task = Task.find(params['id'])
  end

  def update
    @task = Task.find(params['id'])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params['id'])
    @task.destroy
    redirect_to root_path
  end

end