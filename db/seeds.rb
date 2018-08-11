require('pry-byebug')
require_relative('../models/member')
require_relative('../models/gymclass')
require_relative('../models/session')
require_relative('../models/studio')
require_relative('../models/booking')


Member.delete_all()
GymClass.delete_all()
Studio.delete_all()


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

class1 = GymClass.new(
  {
    'name' => 'Spin',
    'capacity' => 20,
    'description' => 'bikes!'
  }
)

class1.save()

studio1 = Studio.new(
  {
    'name' => 'Studio 1'
  }
)

studio1.save()

session1 = Session.new(
  {
    'gymclass_id' => class1.id(),
    'studio_id' => studio1.id(),
    'day' => 'Mon',
    'start_time' => '08:00',
    'end_time' => '09:00',
    'spaces' => 20
  }
)

session2 = Session.new(
  {
    'gymclass_id' => class1.id(),
    'studio_id' => studio1.id(),
    'day' => 'Mon',
    'start_time' => '14:00',
    'end_time' => '15:00',
    'spaces' => 20
  }
)

session1.save()
session2.save()

booking1 = Booking.new(
  {
    'member_id' => member1.id(),
    'session_id' => session1.id()
  }
)

booking1.save()





binding.pry
nil
