module TasksHelper

  def greyed_out?(task)
    if task.soft_delete
      "greyed-out"
    else
      ""
    end
  end

end
