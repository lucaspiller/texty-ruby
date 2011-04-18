require 'spec_helper'

describe Texty::Sms do
  describe "validation" do
    it "should be valid if the destination and body are passed" do
      sms = Texty::Sms.new
      sms.destination = '07000000000'
      sms.body = 'Hello!'
      sms.valid?.should be_true
    end

    it "should not be valid if the destination is missing" do
      sms = Texty::Sms.new
      sms.body = 'Hello!'
      sms.valid?.should be_false
    end

    it "should not be valid if the body is missing" do
      sms = Texty::Sms.new
      sms.destination = '07000000000'
      sms.valid?.should be_false
    end
  end
end
