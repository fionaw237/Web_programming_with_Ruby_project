require_relative('../db/sql_runner')

class Session

  attr_reader :id
  attr_accessor :gymclass_id, :day, :start_time, :end_time, :spaces

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @gymclass_id = options['gymclass_id']
    @day = options['day']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @spaces = options['spaces'].to_i()
  end




end
