module CategoriesHelper

  def status_checkbox(task)
    if task.current?
      raw('<div class="arrow-right"></div>')
    elsif task.complete?
      raw('<input type="checkbox" checked="checked" disabled="true">')
    else
      raw('<input type="checkbox" disabled="true">')
    end
  end

  def status_indicator(task)
    raw('current') if task.current?
  end

end
