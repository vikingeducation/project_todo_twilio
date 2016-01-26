class Todo < ActiveRecord::Base
  validates :task, :date, presence: true
end
