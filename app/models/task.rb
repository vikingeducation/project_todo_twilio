class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :point_value, :lesson_number, presence: true

  scope :started, -> { where.not(started_on: nil) }
  scope :not_started, -> { where(started_on: nil) }
  scope :completed, -> { where.not(completed_on: nil) }
  scope :incomplete, -> { where(completed_on: nil) }
  scope :not_paused, -> { where(paused: false) }

  before_save :unpause_completes_and_not_starteds
  after_save :pause_other_current_tasks

  include TaskShared

  def self.by_date
    order('completed_on DESC')
  end

  def velocity
    task_before = Task.where('paused = ? AND completed_on <= ?', false, started_on).last
    backfill = Task.new(completed_on: Date.today, started_on: Date.yesterday, point_value: 1, name: 'filler')

    task_before = backfill if task_before == nil

    days_to_finish = (task_before.completed_on - task_before.started_on).to_i

    if days_to_finish == 0
      task_before.point_value / 1
    else
      task_before.point_value / days_to_finish
    end
  end

  def projected_completion
    velocity = current_velocity(Proc.new { Task.completed })
    remaining_days = (point_value / velocity).to_i
    started_on + remaining_days
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

  def complete?
    completed_on != nil
  end

  def started?
    started_on != nil
  end

  def paused?
    paused == true
  end

  def current?
    started? && (complete? == false)
  end

  def pause_other_current_tasks
    if started? && !complete? && !paused?
      currently_active_tasks = Task.started.incomplete.not_paused.to_a - [self]
      currently_active_tasks.each do |task|
        task.update_attributes(paused: true)
      end
    end
  end

  def unpause_completes_and_not_starteds
    unpause_completes
    unpause_not_starteds
  end

  private

  def unpause_completes
    if complete? && paused?
      self.paused = false
    end
  end

  def unpause_not_starteds
    if !started? && paused?
      self.paused = false
    end
  end

end
