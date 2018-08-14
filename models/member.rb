require_relative('../db/sql_runner')
require_relative('booking.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :member_type, :phone_number, :address, :dob, :image

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @member_type = options['member_type']
    @phone_number = options['phone_number']
    @address = options['address']
    @dob = options['dob']
    @image = options['image']
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = 'INSERT INTO members (first_name, last_name, member_type, phone_number, address, dob, image) VALUES ($1, $2, $3, $4 , $5, $6, $7) RETURNING id'
    values = [@first_name, @last_name, @member_type, @phone_number, @address, @dob, @image]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
    sql = 'UPDATE members SET (first_name, last_name, member_type, phone_number, address, dob, image) = ($1, $2, $3, $4 , $5, $6, $7) WHERE id = $8'
    values = [@first_name, @last_name, @member_type, @phone_number, @address, @dob, @image, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM members WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def can_book?(session)
    if @member_type == "standard"
      session_hour = session.start_time[0..1].to_i()
      if (session_hour >= 9) && (session_hour < 17)
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def book_class(session)
    if (@member_type == "standard") && (can_book?(session) == false)
      return "out of hours"
    else
      booking = Booking.new('member_id' => @id, 'session_id' => session.id())
      booking.save()
      session.add_member()
      update()
    end
  end

  def self.delete_all()
    sql = 'DELETE FROM members'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM members'
    members = SqlRunner.run(sql)
    return members.map {|member| Member.new(member)}
  end

  def self.find(id)
    sql = 'SELECT * FROM members WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Member.new(result)
  end




end
