module CategoriesHelper

  def status_checkbox(task)
    if task.paused?
      raw('<i class="fas fa-pause"></i>')
    elsif task.current?
      raw('<i class="fas fa-arrow-right"></i>')
    elsif task.complete?
      raw('<input type="checkbox" checked="checked" disabled="true">')
    else
      raw('<input type="checkbox" disabled="true">')
    end
  end

  def status_indicator(task)
    if task.paused?
      'paused'
    elsif task.current?
      'current'
    elsif task.complete?
      'complete'
    end
  end

end
