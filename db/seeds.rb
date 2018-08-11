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

member2 = Member.new(
  {
    'first_name' => 'Joanna',
    'last_name' => 'Wilson',
    'member_type' => 'standard',
    'phone_number' => '07654876524',
    'address' => '32 Another Street, Glasgow, G14 6YH',
    'dob' => '05/08/1989'
  }
)

member3 = Member.new(
  {
    'first_name' => 'Louise',
    'last_name' => 'Kirkcaldy',
    'member_type' => 'premium',
    'phone_number' => '07109876253',
    'address' => '41 Some Place, Dundee, DD5 2BN',
    'dob' => '29/07/1983'
  }
)

member1.save()
member2.save()
member3.save()

class1 = GymClass.new(
  {
    'name' => 'Spin',
    'capacity' => 15,
    'description' => 'bikes!'
  }
)

class2 = GymClass.new(
  {
    'name' => 'Insanity',
    'capacity' => 20,
    'description' => 'Insane!'
  }
)

class1.save()
class2.save()

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
    'spaces' => class1.capacity()
  }
)

session2 = Session.new(
  {
    'gymclass_id' => class1.id(),
    'studio_id' => studio1.id(),
    'day' => 'Mon',
    'start_time' => '14:00',
    'end_time' => '15:00',
    'spaces' => class1.capacity()
  }
)

session3 = Session.new(
  {
    'gymclass_id' => class2.id(),
    'studio_id' => studio1.id(),
    'day' => 'Mon',
    'start_time' => '09:00',
    'end_time' => '10:00',
    'spaces' => class2.capacity()
  }
)

session4 = Session.new(
  {
    'gymclass_id' => class2.id(),
    'studio_id' => studio1.id(),
    'day' => 'Mon',
    'start_time' => '15:00',
    'end_time' => '16:00',
    'spaces' => class2.capacity()
  }
)

session1.save()
session2.save()
session3.save()
session4.save()

booking1 = Booking.new(
  {
    'member_id' => member1.id(),
    'session_id' => session1.id()
  }
)

booking2 = Booking.new(
  {
    'member_id' => member2.id(),
    'session_id' => session1.id()
  }
)

booking3 = Booking.new(
  {
    'member_id' => member1.id(),
    'session_id' => session4.id()
  }
)

booking4 = Booking.new(
  {
    'member_id' => member3.id(),
    'session_id' => session3.id()
  }
)

booking5 = Booking.new(
  {
    'member_id' => member3.id(),
    'session_id' => session2.id()
  }
)

booking1.save()
booking2.save()
booking3.save()
booking4.save()
booking5.save()





binding.pry
nil
