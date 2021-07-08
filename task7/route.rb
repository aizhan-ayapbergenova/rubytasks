
class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if station != first_station && station != last_station
      @stations.delete(station)
    end
  end
  
  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    
    if @stations[0].class.to_s != "Station" 
      raise "The route must contain only stations" 
    else
      @stations[1].class.to_s != "Station"
  end
end
