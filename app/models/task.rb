class Task < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 4, maximum: 40 }
  validates :description, presence: true, length: { minimum: 4 }
  validates :completion_date, presence: true
  validate :validate_completion_date

  private

  def validate_completion_date
    errors.add("Completion date", "is invalid (must be in the future)") if completion_date < Date.today
  end
end
