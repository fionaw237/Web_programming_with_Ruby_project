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
    'first_name' => 'James',
    'last_name' => 'Watson',
    'member_type' => 'premium',
    'phone_number' => '07123456789',
    'address' => '25 A Street, Glasgow, G1 2DR',
    'dob' => '15/05/1963',
    'image' => "/images/person1.jpeg"
  }
)

member2 = Member.new(
  {
    'first_name' => 'Lisa',
    'last_name' => 'Andrews',
    'member_type' => 'standard',
    'phone_number' => '07654876524',
    'address' => '76 Some Place, Glasgow, G12 4RT',
    'dob' => '05/11/1989',
    'image' => "/images/person5.jpeg"
  }
)

member3 = Member.new(
  {
    'first_name' => 'Rachel',
    'last_name' => 'Simpson',
    'member_type' => 'premium',
    'phone_number' => '07129891253',
    'address' => '45 Another Road, Glasgow, G9 6TY',
    'dob' => '29/07/1988',
    'image' => "/images/person6.jpeg"
  }
)

member4 = Member.new(
  {
    'first_name' => 'Michael',
    'last_name' => 'Edwards',
    'member_type' => 'standard',
    'phone_number' => '07109876354',
    'address' => '742 Long Street, Glasgow, G7 8NE',
    'dob' => '30/01/1991',
    'image' => "/images/person2.jpeg"
  }
)

member5 = Member.new(
  {
    'first_name' => 'Richard',
    'last_name' => 'Brown',
    'member_type' => 'premium',
    'phone_number' => '07103876657',
    'address' => '12 Some Street, Glasgow, G4 6KY',
    'dob' => '31/01/1988',
    'image' => "/images/person3.jpeg"
  }
)

member6 = Member.new(
  {
    'first_name' => 'Laura',
    'last_name' => 'Coyle',
    'member_type' => 'standard',
    'phone_number' => '07160576259',
    'address' => '742 Long Street, Glasgow, G7 8NE',
    'dob' => '30/10/1993',
    'image' => "/images/person7.jpeg"
  }
)

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()
member6.save()


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
