require_relative( '../db.sql_runner' )

class Member

  attr_reader( :id, :first_name, :last_name, :date_of_birth )

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = options['date_of_birth'].to_i
  end

end
