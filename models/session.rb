require_relative('../db/sql_runner')
require_relative('gymclass.rb')

class Session

  attr_reader :id
  attr_accessor :gymclass_id, :studio_id, :year, :month, :day, :start_hour, :start_minute, :end_hour, :end_minute, :spaces

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @gymclass_id = options['gymclass_id'].to_i()
    @studio_id = options['studio_id'].to_i()
    @year = options['year']
    @month = options['month']
    @day = options['day']
    @start_hour = options['start_hour']
    @start_minute = options['start_minute']
    @end_hour = options['end_hour']
    @end_minute = options['end_minute']
    @spaces = options['spaces'].to_i()
  end

  def save()
    sql = 'INSERT INTO sessions
          (gymclass_id, studio_id, year, month, day, start_hour, start_minute, end_hour, end_minute, spaces)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING id'
    values = [@gymclass_id, @studio_id, @year, @month, @day, @start_hour, @start_minute, @end_hour, @end_minute, @spaces]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
    sql = 'UPDATE sessions SET
          (gymclass_id, studio_id, year, month, day, start_hour, start_minute, end_hour, end_minute, spaces) =
          ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) WHERE id = $11'
    values = [@gymclass_id, @studio_id, @year, @month, @day, @start_hour, @start_minute, @end_hour, @end_minute, @spaces, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM sessions WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def members()
    sql = 'SELECT members.* FROM members INNER JOIN
    bookings ON bookings.member_id = members.id
    WHERE bookings.session_id = $1'
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|member| Member.new(member)}
  end

  def add_member()
    @spaces -= 1
    update()
  end

  def self.all()
    sql = 'SELECT * FROM sessions'
    sessions = SqlRunner.run(sql)
    return sessions.map {|session| Session.new(session)}
  end

  def gymclass()
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [@gymclass_id]
    result = SqlRunner.run(sql, values).first()
    return GymClass.new(result)
  end

  def pretty_time()
    return "#{@start_hour}:#{@start_minute} - #{@end_hour}:#{@end_minute}"
  end

  def self.find(id)
    sql = 'SELECT * FROM sessions WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Session.new(result)
  end


end
