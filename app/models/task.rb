class Task < ApplicationRecord

  def self.completed_tasks
    where.not(completed_on: nil)
  end

  def self.by_date
    order('completed_on DESC')
  end

  def self.calculate_complete_points
    completed_tasks.pluck('point_value').reduce(&:+)
  end

  def self.calculate_total_points
    all.pluck('point_value').reduce(&:+)
  end

  def self.calculate_percent_complete
    (calculate_complete_points.to_f / calculate_total_points.to_f * 100.00).to_i
  end
end
