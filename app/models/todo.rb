class Todo < ActiveRecord::Base

  validates :description, presence: true
  validates :completion, presence: true

end
