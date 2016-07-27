module TasksHelper

  def sort_by_date(tasks)
    tasks.sort do |a, b|
      DateTime.strptime(a.date, '%Y-%m-%d') <=> DateTime.strptime(b.date, '%Y-%m-%d')
    end
  end

  def parse_date(params)
    %w(1 2 3).map { |e| params["task"]["date(#{e}i)"].to_i }.join('-')
  end
end
