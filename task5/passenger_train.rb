class PassengerTrain < Train
  
  def attach_wagon(wagon)
    @wagon_type = "PassengerWagon"
    super
  end

end
