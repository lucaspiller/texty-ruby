require 'spec_helper'

describe Texty::Device do
  describe "initialisation" do
    before(:all) do
      @device = Texty::Device.new('Three-UK', '07000000000', '127.0.0.1')
    end

    it "should set the operator" do
      @device.operator.should == 'Three-UK'
    end

    it "should set the msisdn" do
      @device.msisdn.should == '07000000000'
    end

    it "should set the ip" do
      @device.ip.should == '127.0.0.1'
    end
  end
end
