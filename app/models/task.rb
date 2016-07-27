class Task < ActiveRecord::Base
  validates :description, length: { minimum: 4 }

  def self.sort_highest_priority
    self.all.order(priority: :desc)
  end

  def self.sort_lowest_priority
    self.all.order(:priority)
  end

end
