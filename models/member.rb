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



end
