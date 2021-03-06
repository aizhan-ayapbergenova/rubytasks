module InstanceCounter
  def self.included(class_counter)
    class_counter.extend ClassMethods
    class_counter.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
