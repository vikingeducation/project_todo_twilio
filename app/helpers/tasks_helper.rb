module TasksHelper

  def completion_status_class(task)
    if task.completed_on
      'complete'
    else
      'incomplete'
    end
  end

  def display_start_date(task)
    task.started_on ? task.started_on : 'TBD'
  end

  def display_end_date(task)
    if task.completed_on
      task.completed_on
    elsif task.started_on
      "projected #{task.projected_completion}"
    else
      'TBD'
    end
  end

  def display_velocity(task)
    task.started_on ?  task.velocity : 'TBD'
  end

  def display_task_set_velocity(set)
    set.current_velocity.to_i
  end

  def display_task_set_projected_completion_date(set)
    set.projected_completion_date.to_s(:long)
  end
end
