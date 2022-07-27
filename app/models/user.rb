class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id

  validates :name, :email, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end
end
