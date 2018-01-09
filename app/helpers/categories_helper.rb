module CategoriesHelper

  def status_checkbox(task)
    if task.complete?
      raw('<input type="checkbox" checked="checked" disabled="true">')
    else
      raw('<input type="checkbox" disabled="true">')
    end
  end

end
