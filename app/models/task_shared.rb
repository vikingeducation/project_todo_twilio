module TaskShared

  def calculate_days_taken(task)
    days = (task.completed_on - task.started_on).to_i
    days == 0 ? 1 : days # compensates for same-day completion
  end

  def current_velocity(proc = Proc.new { completed })
    task = most_recently_completed_task(proc)
    days = calculate_days_taken(task)
    @current_velocity ||= (task.point_value / days).to_f
  end

  def most_recently_completed_task(proc)
    proc.call.order('completed_on DESC').first
  end
end