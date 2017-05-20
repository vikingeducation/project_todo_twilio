class Task < ActiveRecord::Base
	validates :task, :description, :time_to_be_completed, presence: true
	
end
