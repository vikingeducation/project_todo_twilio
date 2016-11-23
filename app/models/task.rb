class Task < ApplicationRecord
  validates :description, length: { minimum: 2 }
end
