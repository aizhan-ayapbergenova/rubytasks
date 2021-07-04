class Station
  attr_reader :trains 
  
  def initialize(name)
    @name = name
    @trains = []
  end  
  
  def take_train
    @trains << train
  end
  
  def trains(type)
    @trains.select { |train| train.type == type }
  end
  
  def send_train
    @trains.delete(train)
  end
end  

class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != first_station && station != last_station
      @stations.delete(station)
    end  
  end
end
  
class Train 
  attr_accessor :speed, :type, :wagon_amount

  def initialize(number, type, wagon_amount)
    @number = number
    @type = type
    @wagon_amount = wagon_amount
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def current_speed
    @speed
  end

  def stop_speed
    @speed = 0
  end

  def route=(route)
    @route = route
    @station_index = 0

  def add_wagons
    if @speed == 0
      @wagon_amount += 1
    end
  end

  def reduce_wagons
    if self.speed == 0 && self.wagon_amount > 0
      self.wagon_amount -= 1 
    end
  end

  def forward
    if next_station
      current_station.send_train(self)
      next_station.take_train(self)
      @station_index += 1
    end
  end

  def backward
    if previous_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @station_index -= 1
    end
  end

  def current_station
    @route.stations[station_index]
  end

  def previous_station
    @route.stations[station_index - 1] if @station_index > 0
    end
  end 
  def next_station
    @route.stations[station_index + 1]
  end
end
