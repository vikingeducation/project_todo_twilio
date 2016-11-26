# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


tags = %w( blue green yellow black)

10.times do |n|

tag_list = ""

  3.times do |i|
    tag_list += "#{tags.sample}, "
  end

  priority = (1..5).to_a.sample
  Task.create(description: "Task #{n}", completion_date: Time.now + 1000, priority: priority, tag_list: tag_list)
end