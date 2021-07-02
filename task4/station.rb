class Station
  attr_accessor :trains 
  
  def initialize(name)
    @name = name
    @trains = []
  end  
  
  def take_train
    @trains.push(train)
  end
  
  def trains(type)
    @trains.select { |train| train.type == type }
  end
  
  def send_train
    @trains.delete(train)
  end
end  
