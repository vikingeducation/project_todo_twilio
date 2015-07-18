class TasksController < ApplicationController

  PHONE_TO = Rails.application.secrets.twilio_phone_to
  PHONE_FROM = Rails.application.secrets.twilio_phone_from

  include SMS

  def index
    @user = User.find(params[:id])
    @tasks = Task.all
  end

  def new
    @user = User.find(params[:id])
    @task = Task.new
  end

  def create
    @user = User.find(params[:id])
    @task = Task.new(params_hash)
    @task.save
    flash[:success] = "New task '#{@task.todo}' was created!"
    SMS.send_sms(PHONE_FROM, PHONE_TO, "You have a new task '#{@task.todo}' to do!")
    redirect_to tasks_path
  end

  def edit
    @user = User.find(params[:id])
    @task = Task.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @task = Task.find(params[:id])
    @task.update(params_hash)
    flash[:notice] = "Your task was updated!"
    redirect_to tasks_path
  end

  def mark_complete
    @user = User.find(params[:id])
    @task = Task.find(params[:id])

    @task.completion_date ? @task.completion_date = nil : @task.completion_date = Time.now
    @task.save
    if @task.completion_date
      flash[:success] = "You have completed #{@task.todo}!"
    else
      flash[:alert] = "You have set #{@task.todo} to 'Not Completed'"
    end
    redirect_to tasks_path
  end

  def destroy
    @user = User.find(params[:id])
    @task = Task.find(params[:id])
    @task.destroy
    flash[:alert] = "Your task was deleted! We have sent you a text message for future reference."
    redirect_to tasks_path
    SMS.send_sms(PHONE_FROM, PHONE_TO, "Task #{@task.todo} was deleted!")
  end


  private

  def params_hash
    params.require(:task).permit(:todo, :completion_date)
  end

end


