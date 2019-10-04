require_relative( '../db.sql_runner' )

class Activity

  attr_reader( :id, :activity_name, :day, :start_time, :duration)

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @activity_name = options['activity_name']
    @day = options['day']
    @start_time = options['start_time']
    @duration = options['duration'].to_i
  end

end
