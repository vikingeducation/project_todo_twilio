module TasksHelper

  def sort_due_date(list)
    list = list.sort { |a, b| a.due_date <=> b.due_date }
  end

  def priority_sort(list)
    list = list.sort { |b, a| a.priority <=> b.priority }
  end

  def determine_sort_method(list, sort_method="created_at")
    case sort_method
      when "created_at" then list
      when "due_date" then sort_due_date(list)
      when "priority" then priority_sort(list)
    end
    list
  end
end
