class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User'


  def self.titles_on_category(category)
    Test
      .joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where('categories.title = ?',category)
      .order(title: :desc)
      .pluck(:title)
  end
end
