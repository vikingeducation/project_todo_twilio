module TasksHelper

  def sort_by_date(tasks)
    tasks.sort do |a, b|
      a.date <=> b.date
    end
  end

  def parse_date(params)
    %w(1 2 3).map { |e| params["task"]["date(#{e}i)"].to_i }.join('-')
  end

  def unparse_date(dates)
    arr = dates.split("-")
    {'year' => arr[0], 'month' => arr[1], 'day' => arr[2]}
  end

end
