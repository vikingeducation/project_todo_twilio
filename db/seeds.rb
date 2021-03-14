# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.find_or_create_by!(name: 'Sample Category')
  Task.create!([
    {category_id: Category.last.id, name: "Sample Task 1", point_value: 30, started_on: Date.parse('01/06/2017'), completed_on: Date.parse('26/06/2017')},
    {category_id: Category.last.id, name: "Sample Task 2", point_value: 50, started_on: Date.parse('26/06/2017'), completed_on: Date.parse('05/07/2017')},
    {category_id: Category.last.id, name: "Sample Task 3", point_value: 20, started_on: Date.parse('10/07/2017'), completed_on: nil},
    {category_id: Category.last.id, name: "Sample Task 4", point_value: 40, started_on: nil, completed_on: nil},
  ])