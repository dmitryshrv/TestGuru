class User < ApplicationRecord
  def test_by_level(level)
    Test.joins("INNER JOIN user_tests on tests.id = user_tests.test_id")
    .where("user_tests.user_id = ? AND tests.level = ?", self.id, level)
  end
end
