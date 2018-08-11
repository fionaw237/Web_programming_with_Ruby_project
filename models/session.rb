require_relative('../db/sql_runner')

class Session

  attr_reader :id
  attr_accessor :gymclass_id, :studio_id, :day, :start_time, :end_time, :spaces

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @gymclass_id = options['gymclass_id']
    @studio_id = options['studio_id']
    @day = options['day']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @spaces = options['spaces'].to_i()
  end

  def save()
    sql = 'INSERT INTO sessions
          (gymclass_id, studio_id, day, start_time, end_time,
           spaces) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id'
    values = [@gymclass_id, @studio_id, @day, @start_time, @end_time, @spaces]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
    sql = 'UPDATE sessions SET
          (gymclass_id, studio_id, day,
          start_time, end_time, spaces) =
          ($1, $2, $3, $4, $5, $6) WHERE id = $7'
    values = [@gymclass_id, @studio_id, @day, @start_time, @end_time, @spaces, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM sessions WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
