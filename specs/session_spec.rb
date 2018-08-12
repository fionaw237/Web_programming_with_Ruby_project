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
        'day' => 'Mon',
        'start_time' => '08:00',
        'end_time' => '09:00',
        'spaces' => 20
      }
    )
  end

  def test_has_day()
    assert_equal("Mon", @session1.day())
  end

  def test_has_start_time()
    assert_equal("08:00", @session1.start_time())
  end

  def test_has_end_time()
    assert_equal("09:00", @session1.end_time())
  end

  def test_has_spaces()
    assert_equal(20, @session1.spaces())
  end

  def test_has_pretty_time()
    time = "08:00 - 09:00"
    assert_equal(time, @session1.pretty_time())
  end

end
