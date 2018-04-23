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
    task.started? ? task.velocity : 'TBD'
  end

  def display_task_set_velocity(set)
    set.current_velocity.to_i
  end

  def display_task_set_projected_completion_date(set)
    set.projected_completion_date.to_s(:long)
  end

  def toggle_favorite(task)
    if task.favorite
      # Show full star and link to un-fave
      link_to raw("<i class='fa fa-star favorite'></i>"), favorite_path(task), remote: true, method: :delete
    else
      # Show hollow star and link to fave
      link_to raw("<i class='far fa-star'></i>"), favorites_path(id: task.id), remote: true, method: :post
    end
  end

  def render_task_set(header_name, task_set, dom_id)
    unless task_set.empty?
      raw("<div id='#{dom_id}'>
            <h2>#{header_name}</h2>
            #{render partial: 'task', collection: task_set}
          </div>")
    end
  end

end
