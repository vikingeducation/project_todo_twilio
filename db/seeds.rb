# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all

100.times do |index|
  Task.create!(description: Faker::Lorem.sentence(3).chop,
                due: Faker::Time.forward(23),
                completed: Faker::Boolean.boolean(0.05),
                priority: Faker::Number.between(0, 10),
                body: Faker::Lorem.paragraph(6, true),
                sticky: Faker::Boolean.boolean(0.05),
                tags: Faker::GameOfThrones.house)
end

p "Created #{Task.count} tasks"
