class Task < ActiveRecord::Base
  validates :description, length: { minimum: 4 }
  validates :title, length: { minimum: 1 }
  validates :rating, inclusion: { in: (0..5).to_a,
                                  message: "%{value} is not a valid rating" }
end
