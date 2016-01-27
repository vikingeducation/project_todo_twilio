# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |num|
  Todo.create(text: "#{num} to-do item", completion_date: Time.now)
end 

Todo.create(text: "I'm Done", completion_date: Time.now, complete: true)