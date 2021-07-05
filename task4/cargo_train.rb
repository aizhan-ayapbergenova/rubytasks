class CargoTrain < Train
  def attach_wagon(wagon)
    @wagon_type = "Cargowagon"
    super
  end
end     
