 
require_relative 'train'

class PassengerTrain < Train

  def attach_wagon(wagon)
    @wagon_type = "PassengerWagon"
    super
  end

end
