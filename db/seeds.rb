require_relative( "../models/activity.rb" )
require_relative( "../models/booking.rb" )
require_relative( "../models/member.rb" )
require("pry-byebug")

Activity.delete_all()
Member.delete_all()
# Booking.delete_all()

activity1 = Activity.new({
  "activity_name" => "Ultimate Spin",
  "day" => "Monday",
  "start_time" => "1800 HOURS",
  "duration" => "45"
  })

  activity1.save()

  member1 = Member.new({
    "first_name" => "Arnold",
    "last_name" => "Schwarzanegger",
    "date_of_birth" => "12/12/12"
    })

  member1.save()

  booking1 = Booking.new({
    "member_id" => member1.id,
    "activity_id" => activity1.id
    })

    booking1.save()
  # binding.pry()
  # nil
