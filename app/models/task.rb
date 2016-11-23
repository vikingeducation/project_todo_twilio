class Task < ApplicationRecord
  validates :description, length: { minimum: 4 }
  validate :completion_date_cannot_be_in_the_past

  def completion_date_cannot_be_in_the_past
    if completion_date.present? && completion_date < Date.today
      errors.add(:completion_date, "can't be in the past")
    end
  end


end
