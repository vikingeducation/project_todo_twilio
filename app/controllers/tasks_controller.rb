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
    @task = Task.find(params[:id])
    @task.destroy
    flash[:alert] = "Your task was deleted!"
    redirect_to tasks_path
  end


  private

    def params_hash
      params.require(:task).permit(:todo, :completion_date)
    end

=begin
      # put your own credentials here
  account_sid = 'AC822fe3e4ffd7ccd8fda1eb9de9f3abf4'
  auth_token = '[AuthToken]'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
  	:from => '+14243254669',
  	:to => '3104255131',
  	:body => 'This is a test message for VCS Twilio app',
  })
end

=end
