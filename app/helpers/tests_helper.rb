module TestsHelper
  TEST_LEVELS = {1 => :easy, 2 => :middle, 3=> :hard}.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def format_time(time)
    minutes = ((time % 3600) / 60).to_i
    seconds = ((time % 3600) % 60).to_i
    "#{sprintf '%02d', minutes}:#{sprintf '%02d', seconds}"
  end

end
