module TodosHelper

  def format_time(due_date)
    due_date.strftime("%Y-%m-%d")
  end

end
