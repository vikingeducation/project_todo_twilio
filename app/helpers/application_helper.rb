module ApplicationHelper

  def task_form_params
    params.require(:task).permit(:title, :description, :owner, :effort, :completion_date)
  end
end

