class Station

  attr_reader :trains, :name
  @stations = []
  

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
end
