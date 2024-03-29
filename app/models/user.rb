class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :created_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id
  has_many :achievements, dependent: :destroy
  has_many :badges, through: :achievements


  #EMAIL_FORMAT = /[A-Z0-9._%+-]+@([A-Z0-9][-A-z0-9]+\.)+[A-z]{2,4}/i

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def test_by_level(level)
    tests.where(level: level)
  end

  def admin?
    is_a?(Admin)
  end

end
