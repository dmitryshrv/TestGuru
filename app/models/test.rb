class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  validate :level_value

  scope :easy, ->{ where(level:1) }
  scope :middle, ->{ where(level:2..4) }
  scope :hard, ->{ where(level:5..Float::INFINITY) }

  scope :test_on_category, ->(category) {joins(:category).where(categories: { title: category })}
  scope :visible, ->{ where(visible: true) }

  def test_on_category_ordered(category)
    test_on_category(category).order(title: :desc).pluck[:title]
  end

  def deadline_time
    self.deadline*60
  end

  private

  def level_value
    errors.add(:test, "Level must be in (1,2,3) range") unless [1,2,3].include? self.level
  end

end
