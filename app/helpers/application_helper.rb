module ApplicationHelper
	def bootstrap_class_for flash_type
    case flash_type
      when 'success'
        "bg-success"
      when 'info'
        "bg-info"
      when 'alert'
        "bg-danger"
      else
        "bg-info"
    end
  end
end
