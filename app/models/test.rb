class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, ->{ where(level:1) }
  scope :middle, ->{ where(level:2..4) }
  scope :hard, ->{ where(level:5..Float::INFINITY) }

  scope :test_on_category, ->(category) {categories.where(title: category)}

  def test_on_category_ordered(category)
    test_on_category(category).order(title: :desc).pluck[:title]
  end
end
