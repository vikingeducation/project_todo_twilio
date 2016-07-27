class Task < ActiveRecord::Base
  validates :description, length: { minimum: 4 }
  validates :title, length: { minimum: 1 }
end
