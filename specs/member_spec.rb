require("minitest/autorun")
require("minitest/rg")
require_relative("../models/member")

class MemberTest < MiniTest::Test

  def setup()
    @member1 = Member.new(
      {
        'first_name' => 'Fiona',
        'last_name' => 'Wilson',
        'member_type' => 'premium',
        'phone_number' => '07123456789',
        'address' => '25 Some Street, Dundee, DD2 2FF',
        'dob' => '15/05/1986'
      }
    )
  end

  def test_has_first_name()
    assert_equal("Fiona", @member1.first_name())
  end

  def test_has_last_name()
    assert_equal("Wilson", @member1.last_name())
  end

  def test_has_member_type()
    assert_equal("premium", @member1.member_type())
  end

  def test_has_phone_number()
    assert_equal('07123456789', @member1.phone_number())
  end

  def test_has_address()
    assert_equal('25 Some Street, Dundee, DD2 2FF', @member1.address())
  end

  def test_has_dob()
    assert_equal('15/05/1986', @member1.dob())
  end

end
