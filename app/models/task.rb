class Task < ApplicationRecord

  validate :valid_completion_date
  validates :completion_date, presence: true

  def valid_completion_date
    begin
      !!Date.parse(:completion_date)
    rescue
      errors.add(:completion_date, "Invalid date!")
    end
  end

end
