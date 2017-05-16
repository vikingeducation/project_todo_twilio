# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tasks = Task.create([{title: 'mow lawn', description: "mow", completion_date: "6.2.17"}, {title: "do dishes", description: "clean dishes", completion_date: "5.19.17"}])
