# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.destroy_all

(1..9).each do |task_num|
  task_num = Task.new
  task_num.title = "Example Task"
  task_num.description = "Lorem ipsum blah blah blah. Lorem ipsum blah blah blah. Lorem ipsum blah blah blah. Lorem ipsum blah blah blah."
  task_num.deadline = "2016-07-04"
  task_num.save
end
