require 'rubygems'
require 'httparty'

module Texty
  class Device
    class Client
      attr_reader :ip, :port

      def initialize(ip, port = 4930)
        @ip = ip
        @port = port
      end

      def send_sms(sms)
        HTTParty.post(url_for("/send_sms"), { :body => sms.to_json })
      end

      protected

      def url_for(path)
        "http://#{@ip}:#{@port}#{path}"
      end
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
      @client ||= Client.new(@ip)
    end
  end
end
