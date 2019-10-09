require_relative( "../models/activity.rb" )
require_relative( "../models/booking.rb" )
require_relative( "../models/member.rb" )
require("pry-byebug")

Activity.delete_all()
Member.delete_all()
# Booking.delete_all()

activity1 = Activity.new({
  "activity_name" => "BOOTCAMP",
  "day" => "Monday",
  "start_time" => "0600",
  "duration" => "45 Minutes",
  "capacity" => 0
  })

  activity2 = Activity.new({
    "activity_name" => "BODYPUMP",
    "day" => "Wednesday",
    "start_time" => "1800",
    "duration" => "45 Minutes",
    "capacity" => 0
    })

    activity3 = Activity.new({
      "activity_name" => "BODYCOMBAT",
      "day" => "Friday",
      "start_time" => "1900",
      "duration" => "45 Minutes",
      "capacity" => 11
      })

      activity4 = Activity.new({
        "activity_name" => " Athletic Stretch",
        "day" => "Thursday",
        "start_time" => "1200",
        "duration" => "60 Minutes",
        "capacity" => 0
        })

  activity1.save()
  activity2.save()
  activity3.save()
  activity4.save()

  member1 = Member.new({
    "first_name" => "Arnold",
    "last_name" => "Schwarzanegger",
    "date_of_birth" => "12/12/12",
    "premium_member" => true
    })

    member2 = Member.new({
      "first_name" => "Lou",
      "last_name" => "Ferigno",
      "date_of_birth" => "05/11/1951",
      "premium_member" => true
      })

      member3 = Member.new({
        "first_name" => "Franco",
        "last_name" => "Columbu",
        "date_of_birth" => "078/08/1941",
        "premium_member" => false
        })

  member1.save()
  member2.save()
  member3.save()

  booking1 = Booking.new({
    "member_id" => member1.id,
    "activity_id" => activity1.id
    })
  booking2= Booking.new({
    "member_id" => member2.id,
    "activity_id" => activity2.id
    })
  booking3 = Booking.new({
    "member_id" => member3.id,
    "activity_id" => activity3.id
    })

    booking1.save()
    booking2.save()
    booking3.save()


  binding.pry()
  nil
