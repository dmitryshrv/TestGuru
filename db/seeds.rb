# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
front_category = Category.create(title:'front')
back_category = (title:'back')


ruby_test = Test.create(title:'Ruby on Rails', level: 1, category_id: back_category.id)
nodejs_test = Test.create(title:'Node.js', level: 2, category_id: back_category.id)
go_test = Test.create(title:'Go in practice', level: 1, category_id: back_category.id)
react_test = Test.create(title:'React native', level: 3, category_id: front_category.id)
css_test = Test.create(title:'CSS Grid', level: 2, category_id: front_category.id)


ivan = User.create(name: 'Ivan', email: 'ivan@mail.ru')
john = User.create(name: 'John', email: 'connor@gmail.com')

UserTest.create([
  {user_id: ivan.id, test_id: ruby_test.id},
  {user_id: ivan.id, test_id: nodejs_test.id},
  {user_id: ivan.id, test_id: go_test.id},
  {user_id: john.id, test_id: ruby_test.id},
  {user_id: john.id, test_id: react_test.id}
])
