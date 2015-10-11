class Todo < ActiveRecord::Base

  validates :description, presence: true, length: { maximum: 200 }
  validates :due, presence: true

end
