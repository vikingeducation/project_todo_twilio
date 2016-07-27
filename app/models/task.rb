class Task < ApplicationRecord
  scope :sticky, -> (bool) { where sticky: bool }

  validates :description, length: { minimum: 4 }
end
