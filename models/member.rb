require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :member_type, :phone_number, :address, :dob

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @member_type = options['member_type']
    @phone_number = options['phone_number']
    @address = options['address']
    @dob = options['dob']
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = 'INSERT INTO members (first_name, last_name, member_type, phone_number, address, dob) VALUES ($1, $2, $3, $4 , $5, $6) RETURNING id'
    values = [@first_name, @last_name, @member_type, @phone_number, @address, @dob]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def self.delete_all()
    sql = 'DELETE FROM members'
    SqlRunner.run(sql)
  end



end
