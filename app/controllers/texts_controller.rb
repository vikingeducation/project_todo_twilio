class TextsController < ApplicationController

  def send_text
    @task = Task.find_by_id(params[:id])

    if @task.update( task_params )
      flash[:success] = "Task Edited"
      redirect_to ( @task.completed ? root_path : @task )
    else
      flash.now[:error] = "Error: " + @task.errors.full_messages.join(', ')
      render :new
    end
  end

end
