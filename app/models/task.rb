class Task < ApplicationRecord

  validates :completion_date, presence: true
  validates :description, length: { minimum: 4 }

end
