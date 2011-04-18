module Texty
  class Device
    class Client
    end

    attr_reader :operator, :msisdn, :ip

    def initialize(operator, msisdn, ip)
      @operator = operator
      @msisdn = msisdn
      @ip = ip
    end

    def send_sms(&block)
      sms = Texty::Sms.new

      # have user fill out params in block
      yield sms
      raise Texty::Exception::InvalidSmsException.new unless sms.valid?

      # send
      client.send_sms(sms)
    end

    def client
      @client ||= Client.new
    end
  end
end
