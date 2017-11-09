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
    if incomplete_tasks.empty?
      0
    else
      incomplete_tasks.pluck('point_value').reduce(&:+)
    end
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

  def self.calculate_days_taken(task)
    days = (task.completed_on - task.started_on).to_i
    days == 0 ? 1 : days # compensates for same-day completion
  end

  def self.calculate_current_velocity
    task = most_recently_completed
    days = calculate_days_taken(task)
    (task.point_value / days).to_f
  end

  def self.calculate_remaining_days
    velocity = calculate_current_velocity
    remaining_points = calculate_remaining_points
    (remaining_points / velocity).to_i
  end

  def self.calculate_completion_date
    remaining_days = calculate_remaining_days
    Date.today + remaining_days
  end

  def projected_completion
    velocity = Task.calculate_current_velocity
    remaining_days = (point_value / velocity).to_i
    started_on + remaining_days
  end

  def velocity
    task_before = Task.where('completed_on <= ?', started_on).last
    backfill = Task.new(completed_on: Date.today, started_on: Date.yesterday, point_value: 1, name: 'filler')

    task_before = backfill if task_before == nil

    days_to_finish = (task_before.completed_on - task_before.started_on).to_i

    if days_to_finish == 0
      task_before.point_value / 1
    else
      task_before.point_value / days_to_finish
    end
  end

  def days_spent
    if started_on && completed_on
      (completed_on - started_on).to_i
    elsif started_on
      (Date.today - started_on).to_i
    else
      'TBD'
    end
  end
end
