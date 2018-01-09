class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def sum_points
    tasks.pluck(:point_value).reduce(:+)
  end
end
