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
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])

    @task.completion_date = Time.now

    @task.save

    redirect_to tasks_path

  end


  private

    def params_hash
    params.require(:task).permit(:todo, :completion_date)
    end
end
