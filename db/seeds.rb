# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
front_category = Category.create(title:'front')
back_category = Category.create(title:'back')


ruby_test = Test.create(title:'Ruby on Rails', level: 1, category_id: back_category.id)
nodejs_test = Test.create(title:'Node.js', level: 2, category_id: back_category.id)
go_test = Test.create(title:'Go in practice', level: 1, category_id: back_category.id)
react_test = Test.create(title:'React native', level: 3, category_id: front_category.id)
css_test = Test.create(title:'CSS Grid', level: 2, category_id: front_category.id)


ivan = User.create(name: 'Ivan', email: 'ivan@mail.ru')
john = User.create(name: 'John', email: 'connor@gmail.com')

q1_ruby = Question.create(body: 'Как данные на экран без перевода строка?', test_id: ruby_test.id)
Answer.create(body:'1. puts', correct: false ,question_id: q1_ruby.id)
Answer.create(body:'2. console.log', correct: false ,question_id: q1_ruby.id)
Answer.create(body:'3. print', correct: true ,question_id: q1_ruby.id)

q2_ruby = Question.create(body: 'Что в Ruby является объектом?', test_id: ruby_test.id)
Answer.create(body:'Всё является объектом', correct: true ,question_id: q2_ruby.id)
Answer.create(body:'Только то, что объявлено черезе class', correct: false ,question_id: q2_ruby.id)
Answer.create(body:'Ничего, ruby не ОО язык', correct: false ,question_id: q2_ruby.id)

UserTest.create([
  {user_id: ivan.id, test_id: ruby_test.id},
  {user_id: ivan.id, test_id: nodejs_test.id},
  {user_id: ivan.id, test_id: go_test.id},
  {user_id: john.id, test_id: ruby_test.id},
  {user_id: john.id, test_id: react_test.id}
])
