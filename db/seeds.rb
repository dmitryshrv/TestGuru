# ivan = User.new(
#   name: 'Ivan',
#   email: 'ivan@mail.ru',
#   last_name:'Drago',
#   type:'Admin',
#   password: '123456',
#   password_confirmation:'123456')

# ivan.skip_confirmation!
# ivan.save!

# front_category = Category.create(title:'front')
# back_category = Category.create(title:'back')

# ruby_test = back_category.tests.find_or_create_by(title:'Ruby on Rails', level: 1, author_id: u.id)
# css_test = front_category.tests.find_or_create_by(title:'CSS Grid', level: 2, author_id: u.id)

# q1_ruby = ruby_test.questions.find_or_create_by(body: 'Как данные на экран без перевода строка?')
# q1_ruby.answers.find_or_create_by(body:'1. puts', correct: false)
# q1_ruby.answers.find_or_create_by(body:'2. console.log', correct: false)
# q1_ruby.answers.find_or_create_by(body:'3. print', correct: true)

# q2_ruby = ruby_test.questions.find_or_create_by(body: 'Что в Ruby является объектом?')
# q2_ruby.answers.find_or_create_by(body:'Всё является объектом', correct: true)
# q2_ruby.answers.find_or_create_by(body:'Только то, что объявлено черезе class', correct: false)
# q2_ruby.answers.find_or_create_by(body:'Ничего, ruby не ОО язык', correct: false)
