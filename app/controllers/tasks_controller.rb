class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_hash)
    @task.save
    flash[:success] = "New task '#{@task.todo}' was created!"
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params_hash)
    flash[:notice] = "Your task was updated!"
    redirect_to tasks_path
  end

  def mark_complete
    @task = Task.find(params[:id])
    @task.completion_date = Time.now
    @task.save
    flash[:success] = "You have completed #{@task.todo}!"
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:alert] = "Your task was deleted!"
    redirect_to tasks_path
  end


  private

    def params_hash
    params.require(:task).permit(:todo, :completion_date)
    end
end
