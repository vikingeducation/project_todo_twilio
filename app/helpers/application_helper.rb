module ApplicationHelper

  def bootstrap_flash_class(type)
    case type
    when 'error' then 'warning'
    when 'success' then 'success'
    else
      'info'
    end
  end

end
