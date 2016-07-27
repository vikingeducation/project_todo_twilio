# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do |n|
  title = "Blog post number #{n}"
  description = "This is a sample blog post. This is where the description would go."
  rating = [1,2,3,4,5].sample
  completion_date = ([1,2,3,4,5].sample).day.from_now
  Task.create!(title: title, description: description, rating: rating, completion_date: completion_date)
end
