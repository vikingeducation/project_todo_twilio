class Todo < ActiveRecord::Base
	def formatted_due
		due.strftime('%l:%M %P - %B %d, %Y')
	end
end
