require("minitest/autorun")
require("minitest/rg")
require_relative("../models/studio")

class StudioTest < MiniTest::Test

  def setup()
    @studio1 = Studio.new(
      {
        'name' => 'Studio 1'
      }
    )
  end

  def test_has_name()
    assert_equal("Studio 1", @studio1.name())
  end

end
