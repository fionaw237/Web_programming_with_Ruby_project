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
    'description' => 'A fun, indoor cycling workout - low impact and you will burn lots of calories!',
    'image' => "/images/spin.jpg"
  }
)

insane = GymClass.new(
  {
    'name' => 'Insane Fitness',
    'capacity' => 22,
    'description' => 'Total body workout based on the principles of high intensity interval training. Insane fitness will push you to new training heights, resulting in more calories burned and faster results.',
    'image' => '/images/insanity.jpg'
  }
)

yoga = GymClass.new(
  {
    'name' => 'Yoga',
    'capacity' => 18,
    'description' => 'In this class, you will practice postures to align, strengthen and promote flexibility in the body. You will also work on breathing techniques and meditation.',
    'image' => '/images/yoga.jpeg'
  }
)

total_body = GymClass.new(
  {
    'name' => 'Total Body Tone',
    'capacity' => 22,
    'description' => 'Shapes, tones and strengthens your entire body!',
    'image' => '/images/bodypump.jpg'
  }
)

boxercise = GymClass.new(
  {
    'name' => 'Boxercise',
    'capacity' => 22,
    'description' => 'Boxercise is an exercise class based on the training concepts boxers use to keep fit. Will typically involve shadow-boxing, skipping, hitting pads, kicking punchbags, press-ups, shuttle-runs and sit-ups.',
    'image' => '/images/boxercise.jpg'
  }
)

circuits = GymClass.new(
  {
    'name' => 'Circuits',
    'capacity' => 24,
    'description' => 'In this class, the studio is set up with various exercise stations. You will move around each station, working on different muscle groups. You will test both your cardio fitness and strength for an all-round challenge.',
    'image' => '/images/circuits.jpg'
  }
)

pilates = GymClass.new(
  {
    'name' => 'Pilates',
    'capacity' => 18,
    'description' => 'If done regularly, Pilates will improve your flexibility and strength, and will develop control and endurance in the your whole body. It puts emphasis on alignment, breathing, developing a strong core, and improving your coordination and balance.',
    'image' => '/images/pilates2.jpeg'
  }
)

dance = GymClass.new(
  {
    'name' => 'Dance Fit',
    'capacity' => 18,
    'description' => 'Dance Fit combines Latin and international music with dance moves. It incorporates both interval training — alternating fast and slow rhythms — and resistance training.',
    'image' => '/images/zumba.jpg'
  }
)

spin.save()
insane.save()
yoga.save()
total_body.save()
boxercise.save()
circuits.save()
pilates.save()
dance.save()

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
    'gymclass_id' => insane.id(),
    'studio_id' => studio1.id(),
    'year' => '2018',
    'month' => '08',
    'day' => '21',
    'start_hour' => '09',
    'start_minute' => '00',
    'end_hour' => '10',
    'end_minute' => '00',
    'spaces' => insane.capacity()
  }
)

session4 = Session.new(
  {
    'gymclass_id' => circuits.id(),
    'studio_id' => studio1.id(),
    'year' => '2018',
    'month' => '08',
    'day' => '21',
    'start_hour' => '15',
    'start_minute' => '00',
    'end_hour' => '15',
    'end_minute' => '45',
    'spaces' => circuits.capacity()
  }
)

session5 = Session.new(
  {
    'gymclass_id' => yoga.id(),
    'studio_id' => studio1.id(),
    'year' => '2018',
    'month' => '08',
    'day' => '21',
    'start_hour' => '10',
    'start_minute' => '00',
    'end_hour' => '11',
    'end_minute' => '00',
    'spaces' => yoga.capacity()
  }
)



session1.save()
session2.save()
session3.save()
session4.save()
session5.save()

member1.book_class(session1)
member1.book_class(session4)
member1.book_class(session3)
member2.book_class(session2)
member2.book_class(session3)
member3.book_class(session1)
member3.book_class(session3)
member4.book_class(session2)
member4.book_class(session3)
member5.book_class(session1)
member5.book_class(session2)
member6.book_class(session2)
member6.book_class(session4)


binding.pry
nil
