class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def sum_points
    tasks.pluck(:point_value).reduce(:+)
  end

  def complete?
    tasks.pluck(:completed_on).exclude?(nil)
  end

  def completed_points
    tasks.completed.pluck(:point_value).reduce(:+)
  end

  def remaining_points
    tasks.incomplete.pluck(:point_value).reduce(:+)
  end
end
