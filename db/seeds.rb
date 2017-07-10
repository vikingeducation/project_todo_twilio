# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all existing posts
Task.destroy_all

# Create 10 sample posts
10.times do |i|
  t = Task.new
  t.title = "Task #{i+1}"
  t.description = "This is the task for the project X"
  t.owner = "Owner #{i+1}"
  t.effort = rand(20)
  t.save!
end
