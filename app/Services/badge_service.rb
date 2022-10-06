class BadgeService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    @category = test_passage.test.category
  end

  def give_badge
    return if passed_more_then_once?

    Badge.all.each do |badge|
      @user.badges << badge if send(badge.rule, badge.rule_value)
    end
  end

  private

  def no_rule(rule_value); end

  def first_attempt_success(rule_value)
    @user.test_passages.where(test: @test).count == 1
  end

  def all_by_category(rule_value)
    rule_value.downcase

    tests = Test.visible.test_on_category(rule_value)
    passed_tests = passed_tests(tests)
    passed_tests.count == tests.count
  end

  def all_by_level(rule_value)
    tests = Test.visible.where(level: rule_value.to_i)
    passed_tests = passed_tests(tests)
    passed_tests.count == tests.count
  end

  def passed_more_then_once?
    @user.test_passages.passed.where(test: @test).count > 1
  end

  def passed_tests(tests)
    tests.joins(:test_passages)
         .where(test_passages: { user: @user, passed: true })
         .distinct
  end
end

