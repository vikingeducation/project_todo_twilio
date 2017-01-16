class Task < ApplicationRecord
	validates :description, length: { minimum: 4 }
end
