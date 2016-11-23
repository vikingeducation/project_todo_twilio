class Task < ApplicationRecord

  validates :completion_date, presence: true
  validates :description, presence: true ,length: { minimum: 4 }

end
