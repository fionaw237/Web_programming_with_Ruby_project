class GymClass

  attr_reader :id
  attr_accessor :name, :capacity, :description

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @capacity = options['capacity']
    @description = options['description']
  end

  def save()
    sql = 'INSERT INTO classes (name, capacity, description) VALUES ($1, $2, $3) RETURNING id'
    values = [@name, @capacity, @description]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
    sql = 'UPDATE classes SET (name, capacity, description) = ($1, $2, $3) WHERE id = $4'
    values = [@name, @capacity, @description, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM classes WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM classes'
    SqlRunner.run(sql)
  end

end
