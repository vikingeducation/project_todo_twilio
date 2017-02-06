module TasksHelper
  def whitelisted_task_params 
    params.require(:task).permit(:name, :description, :completion_date)
  end
end
