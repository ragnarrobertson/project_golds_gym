require_relative( '../db.sql_runner' )

class booking

  attr_reader( :id, :member_id, :activity_id)

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id']
    @activity_id = options['activity_id']
  end

end
