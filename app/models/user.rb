class User < ApplicationRecord

  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id

  def test_by_level(level)
    Test
      .joins("INNER JOIN user_tests on tests.id = user_tests.test_id")
      .where("user_tests.user_id = ? AND tests.level = ?", self.id, level)
  end
end
