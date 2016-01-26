class Todo < ActiveRecord::Base

  scope :sorted, lambda {order("todos.id DESC")}


end
