class CargoTrain < Train

  def attach_wagon(wagon)
    @wagon_type = "CargoWagon"
    super
  end

end
