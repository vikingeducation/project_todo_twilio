module TasksHelper

  def completion_status_class(task)
    if task.completed_on
      'complete'
    else
      'incomplete'
    end
  end

  def display_date(task)
    if task.completed_on
      task.completed_on
    elsif task.started_on
      task.projected_completion
    else
      'TBD'
    end
  end
end
