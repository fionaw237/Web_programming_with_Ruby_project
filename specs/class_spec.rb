require("minitest/autorun")
require("minitest/rg")
require_relative("../models/gymclass")

class GymClassTest < MiniTest::Test

  def setup()
    @class1 = GymClass.new(
      {
        'name' => 'Spin',
        'capacity' => 20,
        'description' => 'bikes!'
      }
    )
  end

  def test_has_name()
    assert_equal("Spin", @class1.name())
  end

  def test_has_capacity()
    assert_equal(20, @class1.capacity())
  end

  def test_has_description()
    assert_equal("bikes!", @class1.description())
  end

end
