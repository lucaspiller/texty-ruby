module Texty
  autoload :Device, 'texty/device'
  autoload :Exception, 'texty/exception'

  class << self
    def obtain(operator = nil, &block)
      yield find_device(operator)
    end

    def available_devices
      raise NotImplementedError
    end

    protected

    def find_device(operator)
      device = if operator.nil?
        available_devices.first
      else
        available_devices.select { |device| device.operator == operator }.first
      end

      if device.nil?
        raise Texty::Exception::DeviceNotFound.new("Device with operator `#{operator}' not found")
      end

      device
    end
  end
end
