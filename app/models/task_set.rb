class TaskSet
  attr_reader :tasks, :incomplete, :completed

  def initialize(tasks)
    @tasks = tasks
    @incomplete = tasks.incomplete_tasks
    @completed = tasks.completed_tasks
  end

  def all
    @tasks
  end

  def remaining_points
    incomplete.empty? ? 0 : sum(incomplete, 'point_value')
  end

  def completed_points
    @completed_points ||= sum(completed, 'point_value')
  end

  def total_points
    @total_points ||= sum(tasks, 'point_value')
  end

  def percent_complete
    @percent_complete ||= (completed_points.to_f / total_points.to_f * 100.00).to_i
  end

  def percent_incomplete
    @percent_incomplete ||= (100 - percent_complete)
  end

  private

  def sum(set, method)
    set.pluck(method).reduce(&:+)
  end

end