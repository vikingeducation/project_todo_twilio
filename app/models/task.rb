class Task < ApplicationRecord
  validates :completion_date, presence: true
  validates :description, presence: true

end
