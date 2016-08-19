class TasksController < ApplicationController
  def index
    @tasks = Task.order(:sticky => :desc).order(:due_date)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    new_task = Task.new(whitelist_params)
    if new_task.save
      flash[:success] = "yeah, new task created!"
      redirect_to task_path(new_task)
    else
      @task = new_task
      show_errors(@task.errors.messages)
      render :new
    end
  end

  def destroy
    task = Task.find(params[:id])
    if task
      task.destroy
      flash[:success] = "task #{task.title} deleted!"
      redirect_to tasks_path
    else
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(whitelist_params)
      flash[:success] = "yeah, new task updated!"
      redirect_to task_path(@task)
    else
      flash.now[:danger] = "Something wrong!"
      render :edit
    end
  end

  def done
    task = Task.find(params[:id])
    task.done = true
    task.save
    redirect_to tasks_path
  end

  def undone
    task = Task.find(params[:id])
    task.done = nil
    task.save
    redirect_to tasks_path
  end

  def asc_sort
    @tasks = Task.order(:sticky => :desc).order(:priority)
    render :index
  end

  def desc_sort
    @tasks = Task.order(:sticky => :desc).order(:priority => :desc)
    render :index
  end

  def sticky
    task = Task.find(params[:id])
    task.sticky = true
    task.save
    redirect_to tasks_path
  end

  def unsticky
    task = Task.find(params[:id])
    task.sticky = false
    task.save
    redirect_to tasks_path
  end

  private
    def whitelist_params
      params.require(:task).permit(:title, :description, :due_date, :priority)
    end

    def show_errors(messages)
      messages.each do |type, errors|
        flash.now[:type] = errors.join
      end
    end
end
