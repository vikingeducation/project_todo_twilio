module TasksHelper

  def sort_complete_date(list)
    list = list.sort { |a, b| a.due_date <=> b.due_date }
  end

end
