class Todo
  attr_reader :todo_list
  attr_reader :last_id

  def initialize(todo_list = nil, last_id = 0)
    @todo_list = todo_list || []
    @last_id = last_id
  end

  def insert_todo(description, due, id = nil)
    if id
      new_id = id
    else
      @last_id += 1
      new_id = @last_id
    end

    new_todo = {'id': new_id, 'description': description, 'due': due}

    if @todo_list.empty?
      @todo_list = [new_todo]
    else
      i = @todo_list.length - 1
      while(i >= 0 && @todo_list[i]['due'] > due)
          # copy the element
          @todo_list[i+1] = @todo_list[i]
          i -= 1
      end

      # insert the actual element
      @todo_list[i+1] = new_todo
    end

    @todo_list
  end

  def update_todo(description, due, id)
    remove_todo(id)
    insert_todo(description, due, id)
  end

  def remove_todo(todo_id)
    @todo_list.select!{|todo| todo['id'] != todo_id}
  end

  def find_todo(todo_id)
    @todo_list.select{|todo| todo['id'] == todo_id}.first
  end
end
