module TaskShared

  def current_velocity(proc = Proc.new { completed })
    # calculates an average from the last 3 tasks
    tasks = most_recently_completed_tasks(3, proc)
    velocities = []
    tasks.each do |task|
      days = calculate_days_taken(task)
      velocity = (task.point_value / days).to_f
      velocities << velocity
    end
    @current_velocity ||= velocities.reduce(&:+) / velocities.length
  end

  def most_recently_completed_tasks(qty, proc)
    proc.call.order('completed_on DESC').to_a.shift(qty)
  end

  def calculate_days_taken(task)
    days = (task.completed_on - task.started_on).to_i
    days == 0 ? 1 : days # compensates for same-day completion
  end
end