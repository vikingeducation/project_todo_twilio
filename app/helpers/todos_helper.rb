module TodosHelper

  def flash_row(todo_id)
    if flash[:id] == todo_id
      if flash[:success]
        "success"
      elsif flash[:info]
        "info"
      end
    end
  end

end
