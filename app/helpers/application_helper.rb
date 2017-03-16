module ApplicationHelper

  def bootstrap_type(type)
    case type
      when "success" then "success"
      when "error" then "warning"
      else
        "info"
    end
  end

end
