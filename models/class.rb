class Class

  attr_reader :id
  attr_accessor :name, :capacity, :description

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @capacity = options['capacity']
    @description = options['description']
  end

end
