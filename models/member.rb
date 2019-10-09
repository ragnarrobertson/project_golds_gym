require_relative( '../db/sql_runner' )

class Member

  attr_reader( :id, :first_name, :last_name, :date_of_birth )

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = options['date_of_birth']
    @premium_member = options['premium_member']
  end

    def save()
      sql = "INSERT INTO members
      (
        first_name,
        last_name,
        date_of_birth,
        premium_member
        )
        VALUES
        (
          $1, $2, $3, $4
          )
          RETURNING id"
          values = [@first_name, @last_name, @date_of_birth, @premium_member]
          results = SqlRunner.run(sql, values)
          @id = results.first()['id'].to_i
    end

    def update()
    sql = "UPDATE members
    SET
    (
      first_name,
      last_name,
      date_of_birth,
      premium_member
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @date_of_birth, @premium_member, @id]
    SqlRunner.run( sql, values )
  end

    def activities()
      sql = "SELECT a.* FROM activities a INNER JOIN bookings b on b.activity_id = a.id WHERE b.member_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map { |hash| Activity.new( hash) }
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
      results = SqlRunner.run( sql, values )
      return Member.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM members"
      SqlRunner.run( sql )
    end

    def delete()
  sql = "DELETE FROM members
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

end
