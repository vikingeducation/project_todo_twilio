module TasksHelper

  def sort_by_date(tasks)
    tasks.sort do |a, b|
      DateTime.strptime(a.date, '%Y-%m-%d %H:%M:%S %z') <=> DateTime.strptime(b.date, '%Y-%m-%d %H:%M:%S %z')
    end
  end

end
