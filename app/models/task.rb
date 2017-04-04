class Task < ApplicationRecord
  validates :title, length: { minimum: 4}

end
