class Todo < ActiveRecord::Base

  validates :description, presence: true, length: { maximum: 200 }
  validates :completion, presence: true

end
