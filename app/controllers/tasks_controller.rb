class TasksController < ApplicationController

  def index
    @tasks = Task.all
    if params[:order]
      session[:order] = params[:order]
    end

    if params[:cat_order]
      sort_order(session[:order], params[:cat_order])
    else
      sort_order(session[:order])
    end
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
      flash[:notice] = "Task successfully created, also messaged you"
      redirect_to @task
    else
      flash.now[:error] = "Task was not created"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task succesfully destroyed"
    else
      flash[:error] = "Task was not deleted"
    end
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if params[:sticky]
      @task.update(:priority => 6)
      redirect_to root_path
    elsif @task.update(task_params)
      flash[:notice] = "Task succesfully updated"
      redirect_to @task
    else
      flash.now[:notice] = "Task was not updated"
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:id])
    mark_complete
    redirect_to root_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :complete_date, :priority, :category)
    end

    def sort_order(order, categories = nil)
      if categories != nil
        categories_arr = @tasks.select{|task| task.category == categories }
        @tasks -= categories_arr
      else
        categories_arr = []
      end

      priority_arr = @tasks.select {|task| task.priority == 6}
      @tasks -= priority_arr

      case order
      when "asc"
        @tasks = @tasks.sort_by { |task| task.priority }.reverse
      when "desc"
        @tasks = @tasks.sort_by { |task| task.priority }
      else
        @tasks = @tasks.sort_by { |task| task.complete_date }
      end
      @tasks = priority_arr + categories_arr +  @tasks
    end

    def mark_complete
      if @task.completed
        @task.completed = false
        flash[:notice] = "Task marked as incomplete"
      else
        @task.completed = true
        flash[:notice] = "Task marked as completed"
      end

      @task.save
    end
end
