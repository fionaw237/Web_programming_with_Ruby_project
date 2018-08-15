require("minitest/autorun")
require("minitest/rg")
require_relative("../models/session")

class SessionTest < MiniTest::Test

  def setup()
    # @class1 = GymClass.new(
    #   {
    #     'name' => 'Spin',
    #     'capacity' => 20,
    #     'description' => 'bikes!'
    #   }
    # )
    @session1 = Session.new(
      {
        'year' => '2018',
        'month' => '08',
        'day' => '20',
        'start_hour' => '08',
        'start_minute' => '00',
        'end_hour' => '09',
        'end_minute' => '00',
        'spaces' => 20
      }
    )
  end

  def test_has_year()
    assert_equal("2018", @session1.year())
  end

  def test_has_month()
    assert_equal("08", @session1.month())
  end

  def test_has_day()
    assert_equal("20", @session1.day())
  end

  def test_has_start_hour()
    assert_equal("08", @session1.start_hour())
  end

  def test_has_start_minute()
    assert_equal("00", @session1.end_minute())
  end

  def test_has_end_hour()
    assert_equal("09", @session1.end_hour())
  end

  def test_has_end_minute()
    assert_equal("00", @session1.end_minute())
  end

  def test_has_spaces()
    assert_equal(20, @session1.spaces())
  end

  def test_has_pretty_time()
    time = "08:00 - 09:00"
    assert_equal(time, @session1.pretty_time())
  end

end
