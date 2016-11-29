class Task < ApplicationRecord
  validates :description, length: {minimum: 4}
  validates :due, presence: true
end
