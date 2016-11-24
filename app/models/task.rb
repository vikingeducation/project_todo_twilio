class Task < ApplicationRecord
  validates :title, length: {maximum: 150}, presence: true
end
