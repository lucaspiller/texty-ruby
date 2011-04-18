require 'spec_helper'

describe Texty, "obtaining device" do
  before(:each) do
    Texty.stub!(:available_devices).and_return([
      Texty::Device.new('Three-UK', '07000000000', '127.0.0.1')
    ])
  end

  it "should return a device" do
    Texty.obtain do |device|
      device.should be_kind_of(Texty::Device)
    end
  end

  it "should allow requesting a specific device" do
    Texty.obtain('Three-UK') do |device|
      device.should be_kind_of(Texty::Device)
      device.operator.should == 'Three-UK'
    end
  end

  it "should raise an error if a device is not found" do
    lambda {
      Texty.obtain('JibbaJabber-UK') do |device|
        fail
      end
    }.should raise_error(Texty::Exception::DeviceNotFound, "Device with operator `JibbaJabber-UK' not found")
  end
end
