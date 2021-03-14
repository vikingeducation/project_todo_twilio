module ApplicationHelper

  def bootstrap_flash_class(type)
    case type
    when 'notice' then 'success'
    when 'alert' then 'danger'
    when 'error' then 'warning'
    else
      'info'
    end
  end

  def button_classes(style = 'primary')
    "btn btn-sm btn-#{style}"
  end

end
