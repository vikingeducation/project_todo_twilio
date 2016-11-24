module TasksHelper

  def greyed_out?(task)
    if task.completed
      "greyed-out"
    else
      ""
    end
  end

end
