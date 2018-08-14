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
    'first_name' => 'Bart',
    'last_name' => 'Simpson',
    'member_type' => 'premium',
    'phone_number' => '07123456789',
    'address' => '742 Evergreen Terrace, Springfield',
    'dob' => '15/05/1986',
    'image' => "/images/bart_simpson.jpeg"
  }
)

member2 = Member.new(
  {
    'first_name' => 'Lisa',
    'last_name' => 'Simpson',
    'member_type' => 'standard',
    'phone_number' => '07654876524',
    'address' => '742 Evergreen Terrace, Springfield',
    'dob' => '05/08/1989',
    'image' => "/images/lisa_simpson.jpeg"
  }
)

member3 = Member.new(
  {
    'first_name' => 'Marge',
    'last_name' => 'Simpson',
    'member_type' => 'premium',
    'phone_number' => '07109876253',
    'address' => '742 Evergreen Terrace, Springfield',
    'dob' => '29/07/1965',
    'image' => "/images/marge_simpson.jpg"
  }
)

member4 = Member.new(
  {
    'first_name' => 'Ned',
    'last_name' => 'Flanders',
    'member_type' => 'standard',
    'phone_number' => '07109876253',
    'address' => '740 Evergreen Terrace, Springfield',
    'dob' => '30/01/1966',
    'image' => "/images/ned_flanders.jpeg"
  }
)

member1.save()
member2.save()
member3.save()
member4.save()


spin = GymClass.new(
  {
    'name' => 'Spin',
    'capacity' => 15,
    'description' => 'bikes!',
    'image' => "/images/spin.jpg"
  }
)

insanity = GymClass.new(
  {
    'name' => 'Insanity',
    'capacity' => 22,
    'description' => 'Insane!',
    'image' => '/images/insanity.jpg'
  }
)

yoga = GymClass.new(
  {
    'name' => 'Yoga',
    'capacity' => 18,
    'description' => 'Relax!',
    'image' => '/images/yoga.jpeg'
  }
)

bodypump = GymClass.new(
  {
    'name' => 'Bodypump',
    'capacity' => 22,
    'description' => 'bodypump!',
    'image' => '/images/bodypump.jpg'
  }
)

boxercise = GymClass.new(
  {
    'name' => 'Boxercise',
    'capacity' => 22,
    'description' => 'boxing!',
    'image' => '/images/boxercise.jpg'
  }
)

circuits = GymClass.new(
  {
    'name' => 'Circuits',
    'capacity' => 24,
    'description' => 'circuits!',
    'image' => '/images/circuits.jpg'
  }
)

p90x = GymClass.new(
  {
    'name' => 'P90X',
    'capacity' => 24,
    'description' => 'P90X!',
    'image' => '/images/p90x.jpeg'
  }
)

pilates = GymClass.new(
  {
    'name' => 'Pilates',
    'capacity' => 18,
    'description' => 'pilates!',
    'image' => '/images/pilates2.jpeg'
  }
)

zumba = GymClass.new(
  {
    'name' => 'Zumba',
    'capacity' => 18,
    'description' => 'dance!',
    'image' => '/images/zumba.jpg'
  }
)

spin.save()
insanity.save()
yoga.save()
bodypump.save()
boxercise.save()
circuits.save()
p90x.save()
pilates.save()
zumba.save()

studio1 = Studio.new(
  {
    'name' => 'Studio 1'
  }
)

studio1.save()

session1 = Session.new(
  {
    'gymclass_id' => spin.id(),
    'studio_id' => studio1.id(),
    'year' => '2018',
    'month' => '08',
    'day' => '20',
    'start_hour' => '08',
    'start_minute' => '00',
    'end_hour' => '09',
    'end_minute' => '00',
    'spaces' => spin.capacity()
  }
)

session2 = Session.new(
  {
    'gymclass_id' => spin.id(),
    'studio_id' => studio1.id(),
    'year' => '2018',
    'month' => '08',
    'day' => '20',
    'start_hour' => '14',
    'start_minute' => '00',
    'end_hour' => '15',
    'end_minute' => '00',
    'spaces' => spin.capacity()
  }
)

session3 = Session.new(
  {
    'gymclass_id' => insanity.id(),
    'studio_id' => studio1.id(),
    'year' => '2018',
    'month' => '08',
    'day' => '21',
    'start_hour' => '09',
    'start_minute' => '00',
    'end_hour' => '10',
    'end_minute' => '00',
    'spaces' => insanity.capacity()
  }
)

session4 = Session.new(
  {
    'gymclass_id' => insanity.id(),
    'studio_id' => studio1.id(),
    'year' => '2018',
    'month' => '08',
    'day' => '21',
    'start_hour' => '15',
    'start_minute' => '00',
    'end_hour' => '15',
    'end_minute' => '45',
    'spaces' => insanity.capacity()
  }
)



session1.save()
session2.save()
session3.save()
session4.save()

member1.book_class(session1)
member1.book_class(session4)
member2.book_class(session2)
member2.book_class(session3)
member3.book_class(session1)
member3.book_class(session3)


binding.pry
nil
