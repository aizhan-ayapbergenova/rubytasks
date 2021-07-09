class CargoWagon < Wagon
  
    attr_reader :free_space, :filled_space
    
    def initialize(space)
      @free_space = space
      @taken_space = 0
      raise "Space can not be empty or negative" if space == 0 || space < 0
      super
    end
    
    def fill_space(space)
      raise "Available space is - #{@free_volume}" if space > @free_space
      if @free_space> 0
        @free_space -= space
        @filled_space += space
      else
        puts "No free space"
      end
  end