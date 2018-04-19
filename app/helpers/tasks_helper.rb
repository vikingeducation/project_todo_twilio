module TasksHelper

  def completion_status_class(task)
    if task.paused? && !task.complete?
      'paused'
    elsif task.current?
      'current-task'
    elsif task.complete?
      'complete'
    else
      'incomplete'
    end
  end

  def display_start_date(task)
    task.started? ? task.started_on : 'TBD'
  end

  def display_end_date(task)
    if task.complete?
      task.completed_on
    elsif task.started?
      "projected #{task.projected_completion}"
    else
      'TBD'
    end
  end

  def display_velocity(task)
    task.started? ?  task.velocity : 'TBD'
  end

  def display_task_set_velocity(set)
    set.current_velocity.to_i
  end

  def display_task_set_projected_completion_date(set)
    set.projected_completion_date.to_s(:long)
  end

  def favorite_unfavorite(task)
    if task.favorite
      link_to raw("<i class='fa fa-star favorite'></i>"), favorite_path(task), method: :delete
    else
      link_to raw("<i class='far fa-star'></i>"), favorite_path(task), method: :patch
    end
  end

end
