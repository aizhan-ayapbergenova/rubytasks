class Train 
  attr_accessor :speed, :type, :capacty

  def initialize(number, type, capacty)
    @number = number
    @type = type
    @capacty = capacty
    @speed = 0
  end

  def accelerate
    speed += 10
  end

  def current_speed
    speed
  end

  def stop_speed
    speed = 0
  end

  def route=(route)
    @route = route
    @station_index = 0

  def add_wagons
    if speed == 0
      capacty += 1
    end
  end

  def reduce_wagons
    if speed == 0
      capacty -= 1
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

  def next_station
    @route.stations[station_index + 1]
  end
end
