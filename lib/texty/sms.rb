require 'json'

module Texty
  class Sms
    attr_accessor :destination, :body

    def valid?
      !destination.nil? && !body.nil?
    end

    def to_json
      {
        :sms => {
          :destination => destination,
          :body => body
        }
      }.to_json
    end
  end
end
