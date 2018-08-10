require('pry-byebug')
require_relative('../models/member')

member1 = Member.new(
  {
    'first_name' => 'Fiona',
    'last_name' => 'Wilson',
    'member_type' => 'premium',
    'phone_number' => '07123456789',
    'address' => '25 Some Street, Dundee, DD2 2FF',
    'dob' => '15/05/1986'
  }
)

member1.save()


binding.pry
nil
