class Station

  attr_reader :trains, :name
  @stations = []
  ATTR_NAME = /^([a-z\d]\s?-?)*$/i

  def initialize(name)
    @name = name
    @trains = []
  end
  
  def self.all
    @stations
  end

  def take_train(train)
    @trains.push(train) 
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains(type)
    @trains.select { |train| train.class.to_s == type }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    raise 'Enter the name of the station' if name.length.zero?
    raise 'The name is incorrect' if name !~ ATTR_NAME
  end
end
