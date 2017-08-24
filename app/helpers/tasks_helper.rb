module TasksHelper
  def whitelisted_parameters
    params.require(:task).permit(:description, :due_date, :urgency)
  end
end
