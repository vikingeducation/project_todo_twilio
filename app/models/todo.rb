class Todo < ActiveRecord::Base
  validates :text,  presence: true
  validates :date,   presence: true
end
