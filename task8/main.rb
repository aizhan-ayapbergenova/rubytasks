require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'instance_counter'

class App
  @error
  def start
    loop do
      puts '-----------------------------------------'
      puts '1. Create a station'
      puts '2. Create a train'
      puts '3. Create a route'
      puts '4. Add a station to the route'
      puts '5. Delete a station from the route'
      puts '6. Set route for the train'
      puts '7. Attach wagon'
      puts '8. Unhook wagon'
      puts '9. Move train to the next station'
      puts '10. Move train to the previous station'
      puts '11. Display the stations list'
      puts '12. Display the trains list'
      puts '0. Exit'
      puts '-----------------------------------------'
      choice = gets.to_i
      break if choice == 0

      case choice
      when 1 then create_station
      when 2 then create_train
      when 3 then route_create
      when 4 then route_add
      when 5 then route_delete
      when 6 then set_route
      when 7 then attach_wagon
      when 8 then unhook_wagon
      when 9 then train_forward
      when 10 then train_backward
      when 11 then display_stations
      when 12 then display_trains
      else
        puts 'Enter the valid number'
      end
    end
  end

  private

  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes   = []
    @trains   = []
  end

  def create_station
    puts 'Add a Station name:'
    @stations << Station.new(gets.chomp)
  rescue StandardError => e
    error_output
    retry
  end

  def create_train
    puts '1. Passenger Train'
    puts '2. Cargo Train'
    train_type = gets.to_i

    if train_type <= 0 || train_type > 2
      puts 'Please try again'
    else
      puts 'Train number:'
      train_number = gets.chomp
    end

    @trains << PassengerTrain.new(train_number) if train_type == 1
    @trains << CargoTrain.new(train_number)     if train_type == 2
  rescue StandardError => e
    error_output
    retry
  end

  def route_create
    display_stations
    puts 'First station number:'
    first = gets.to_i - 1
    puts 'Last station number:'
    last = gets.to_i - 1

    if first < 0 || first > @stations.size - 1
      puts 'Error'
    elsif last < 0 || last > @stations.size - 1
      puts 'Error'
    else
      first_station = @stations[first]
      last_station  = @stations[last]

      @routes << Route.new(first_station, last_station)
    end
  rescue StandardError => e
    error_output
    retry
  end

  def route_add
    route_list

    display_stations
    puts 'Station:'
    station = gets.to_i - 1

    if @route < 0 || @route > @routes.size - 1
      puts 'Error'
    elsif station < 0 || station > @stations.size - 1
      puts 'Error'
    else
      @routes[@route].add_station(@stations[station])
    end
  rescue StandardError => e
    error_output
    retry
  end

  def route_remove
    route_list

    puts 'Stations in the route:'
    @routes[@route].stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
    puts 'Station number:'
    number = gets.to_i - 1

    station_in_route = @routes[@route].stations[number]
    @routes[@route].remove_station(station_in_route)
  end

  def set_route
    display_trains

    route_list

    @trains[@train].route = @routes[@route]
  end

  def attach_wagon
    display_trains

    @trains[@train].attach_wagon(PassengerWagon.new)
    @trains[@train].attach_wagon(CargoWagon.new)
  end

  def unhook_wagon
    display_trains

    @trains[@train].unhook_wagon
  end

  def reserve_seat
    wagon_action('PassengerTrain')

    @trains[@train].wagons[@railcar].take_seat
  end

  def fill_wagon
    wagon_action('CargoTrain')

    puts 'Space:'
    space = gets.to_f
    @trains[@train].wagons[@railcar].fill(volume)
  end

  def train_forward
    display_trains

    @trains[@train].forward
  end

  def train_backward
    display_trains

    @trains[@train].backward
  end

  def show_trains
    display_stations
    puts 'Station number:'
    number = gets.to_i - 1
    puts "Train's type:"
    puts '1. Passenger Trains'
    puts '2. Cargo Trains'
    type = gets.to_i

    train_type = 'PassengerTrain' if type == 1
    train_type = 'CargoTrain'     if type == 2

    puts @stations[number].station_trains(train_type)
  end

  def display_trains
    puts 'Available trains:'
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train}" }
    puts 'Train:'
    @train = gets.to_i - 1

    puts 'Error' if @train < 0 || @train > @trains.size - 1
  end

  def display_stations
    puts 'Available stations:'
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
  end

  def route_list
    puts 'Available routes'
    @routes.each.with_index(1) { |route, index| puts "#{index}. #{route}" }
    puts 'Route:'
    @route = gets.to_i - 1
  end

  def wagon_info
    proc do |wagon, index|
      index += 1
      info = "#{index}. Wagon №#{wagon.number}. Type: #{wagon.class}."
      if wagon.class.to_s == 'PassengerWagon'
        puts info + "Available seats: #{wagon.free_seats}. Reserved seats: #{wagon.reserved_seats}"
      else
        puts info + "Available space: #{wagon.free_space}. Taken volume: #{wagon.filled_space}"
      end
    end
  end

  def train_info
    proc do |train, index|
      index += 1
      puts "#{index}. Train №#{train.number}. Type: #{train.class}. Amount of railcars: #{train.wagons.size}"
    end
  end

  # метод для отбора пассажирских и грузовых поездов
  def wagon_action(type)
    station_list

    type_train = @stations[@number].station_trains(type)

    type_train.each_with_index(&train_info)
    puts 'Train:'
    @train = gets.to_i - 1

    wrong_number if @train < 0 || @train > type_train.size

    @trains[@train].pass_wagon(&railcar_info)
    puts 'Wagon:'
    @wagon = gets.to_i - 1

    if @railcar < 0
      wrong_number
    else
      @wagon > @trains.size
    end
  end

  def error_output
    puts @error.message.to_s
  end

  def wrong_number
    raise 'Enter the valid number'
  end
end

App.new.start
