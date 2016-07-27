module TasksHelper

  def sort_by_date(tasks)
    tasks.sort do |a, b|
      DateTime.strptime(a.date, '%Y-%m-%d %H:%M:%S %z') <=> DateTime.strptime(b.date, '%Y-%m-%d %H:%M:%S %z')
    end
  end

  def parse_date(params)
    %w(1 2 3).map { |e| params["task"]["date(#{e}i)"].to_i }
  end



end
