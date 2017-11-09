class Task < ApplicationRecord

  belongs_to :category

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :point_value, presence: true

  def self.incomplete_tasks
    where(completed_on: nil)
  end

  def self.completed_tasks
    where.not(completed_on: nil)
  end

  def self.by_date
    order('completed_on DESC')
  end

  def self.calculate_remaining_points
    incomplete_tasks.pluck('point_value').reduce(&:+)
  end

  def self.calculate_complete_points
    completed_tasks.pluck('point_value').reduce(&:+)
  end

  def self.calculate_total_points
    all.pluck('point_value').reduce(&:+)
  end

  def self.calculate_percent_incomplete
    (calculate_remaining_points.to_f / calculate_total_points.to_f * 100.00).to_i
  end

  def self.calculate_percent_complete
    (calculate_complete_points.to_f / calculate_total_points.to_f * 100.00).to_i
  end

  def self.most_recently_completed
    completed_tasks.order('completed_on DESC').first
  end

  def self.calculate_current_velocity
    task = most_recently_completed
    days = (task.completed_on - task.started_on).to_i
    (task.point_value / days).to_f
  end

  def self.calculate_completion_date
    velocity = calculate_current_velocity

    remaining_points = calculate_remaining_points
    remaining_days = (remaining_points / velocity).to_i

    Date.today + remaining_days
  end
end
