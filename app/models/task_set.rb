class TaskSet
  attr_reader :tasks, :current, :to_do, :completed

  def initialize(tasks)
    @tasks = tasks
    @current = tasks.incomplete.started.not_paused
    @to_do = tasks.incomplete.not_started.or(tasks.incomplete.where(paused: true)).order('lesson_number')
    @completed = tasks.completed.order('completed_on DESC')
  end

  include TaskShared

  def all
    @tasks
  end

  def points_remaining
    to_do.empty? ? 0 : sum(to_do, 'point_value')
  end

  def points_completed
    @points_completed ||= sum(completed, 'point_value')
  end

  def total_points
    @total_points ||= sum(tasks, 'point_value')
  end

  def percent_complete
    @percent_complete ||= (points_completed.to_f / total_points.to_f * 100.00).to_i
  end

  def percent_incomplete
    @percent_incomplete ||= (100 - percent_complete)
  end

  def remaining_days
    (points_remaining / current_velocity).to_i
  end

  def projected_completion_date
    Date.today + remaining_days
  end

  private

  def sum(set, method)
    set.pluck(method).reduce(&:+)
  end

end
