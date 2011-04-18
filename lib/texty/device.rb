module Texty
  class Device
    attr_reader :operator, :msisdn, :ip

    def initialize(operator, msisdn, ip)
      @operator = operator
      @msisdn = msisdn
      @ip = ip
    end
  end
end
