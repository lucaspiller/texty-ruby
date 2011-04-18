module Texty
  class Sms
    attr_accessor :destination, :body

    def valid?
      !destination.nil? && !body.nil?
    end
  end
end
