class Task < ApplicationRecord
  validates :description, lengh: {minimum: 4}
end
