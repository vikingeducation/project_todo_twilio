class Task < ActiveRecord::Base
  validates :description, length: { minimum: 4 }
  validates :category, length: { minimum: 1, maximum:10 }
end
