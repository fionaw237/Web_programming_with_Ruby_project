class Studio

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO studios (name) VALUES ($1) RETURNING id'
    values = [@name]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
    sql = 'UPDATE studios SET name = $1 WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM studios WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM studios'
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = 'SELECT * FROM studios WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Studio.new(result)
  end

  def self.all()
    sql = 'SELECT * FROM studios'
    studios = SqlRunner.run(sql)
    return studios.map {|studio| Studio.new(studio)}
  end


end
