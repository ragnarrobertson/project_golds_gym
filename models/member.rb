require_relative( '../db/sql_runner' )

class Member

  attr_reader( :id, :first_name, :last_name, :date_of_birth )

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = options['date_of_birth'].to_i
  end

    def save()
      sql = "INSERT INTO members
      (
        first_name,
        last_name,
        date_of_birth
        )
        VALUES
        (
          $1, $2, $3
          )
          RETURNING id"
          values = [@first_name, @last_name, @date_of_birth]
          results = SqlRunner.run(sql, values)
          @id = results.first()['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM members"
      results = SqlRunner.run( sql )
      return results.map { |member| Member.new( member )}
    end

    def self.find( id )
      sql = "SELECT * FROM members
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( swl, values )
      return Member.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM members"
      SqlRunner.run( sql )
    end

end
