class Todo
  attr_reader :todo_list

  def initialize(todo_list = nil)
    @todo_list = todo_list || []
  end

  def insert_todo(description, due)
    # Step through sorted list right to left.
    # As long as your due is less than the element
    # at @todo_list[i] and you still have elements
    i = @todo_list.length
    while(i >= 0 && @todo_list[i].last > due)
        # copy the element
        @todo_list[i+1] = @todo_list[i]
        i -= 1
    end

    # insert the actual element
    @todo_list[i+1] = [description, due];

    # return the @todo_list with the inserted element
    @todo_list
  end

end
