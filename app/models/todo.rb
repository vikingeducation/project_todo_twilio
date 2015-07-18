class Todo < ActiveRecord::Base
  validates :goal, presence: true
  validates :completion_date, presence: true

end
