class Task < ApplicationRecord
  validates :name,        length: { minimum: 4 }
  validates :description, length: { minimum: 4 }
end
