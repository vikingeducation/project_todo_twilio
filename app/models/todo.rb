class Todo < ActiveRecord::Base

  scope :sorted, lambda {order("todos.complete ASC, todos.id DESC")}

end
