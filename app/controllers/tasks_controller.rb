require 'sms_sender'

class TasksController < ApplicationController

  def index
    @new_task = Task.new
    @tasks = Task.order(:due)
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def create
    if Task.new(strong_params).save
      flash[:update] = "You created a task"
    else
      flash[:error] = "Your input was too short. Try again"
    end
    redirect_to tasks_url
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    @task.destroy
    flash[:update] = "You destroyed a task"
    redirect_to tasks_url
  end

  def edit
    @task = Task.find_by_id(params[:id])
  end

  def update
    @task = Task.find_by_id(params[:id])
    if @task.update_attributes(strong_params)
      flash[:update] = "You updated a task"
      redirect_to tasks_url
    else
      flash[:error] = "Your input was too short. Try again"
      redirect_to :back
    end

  end

  def text_message
    puts params[:id]
    @task = Task.find_by_id(params[:id])
    body = @task[:description]
    if send_message(body)
      flash[:update] = "Text message sent!"
    else
      flash[:error] = "Text message could not be sent"
    end
    redirect_to tasks_url
  end

  private
  def strong_params
    params.require(:task).permit(:due, :description, :completed)
  end

end
