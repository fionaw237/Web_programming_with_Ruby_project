class Booking

  attr_reader :id, :member_id
  attr_accessor :session_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @session_id = options['session_id'].to_i()
  end

  def save()
    sql = 'INSERT INTO bookings (member_id, session_id) VALUES ($1, $2) RETURNING id'
    values = [@member_id, @session_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
    sql = 'UPDATE bookings SET(member_id, session_id) = ($1, $2) WHERE id = $3'
    values = [@member_id, @session_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM bookings WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
