require 'spec_helper'

describe Texty::Device do
  before(:all) do
    @device = Texty::Device.new('Three-UK', '07000000000', '127.0.0.1')
  end

  describe "initialisation" do
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

  describe "#send_sms" do
    describe "valid parameters" do
      before(:each) do
        @sms = Texty::Sms.new
        @sms.stub!(:valid?).and_return(true)
        Texty::Sms.stub!(:new).and_return(@sms)

        @client = Texty::Device::Client.new
        @client.stub!(:send_sms).and_return(true)
        @device.stub!(:client).and_return(@client)
      end

      it "should return a new sms object in the block" do
        @device.send_sms do |sms|
          sms.should be_kind_of(Texty::Sms)
          # parameters go here
        end
      end

      it "should attempt to send the sms" do
        @client.should_receive(:send_sms).with(@sms)

        @device.send_sms do |sms|
          sms.should == @sms
          # parameters go here
        end
      end
    end

    describe "invalid parameters" do
      before(:each) do
        @sms = Texty::Sms.new
        @sms.stub!(:valid?).and_return(false)
        Texty::Sms.stub!(:new).and_return(@sms)

        @client = Texty::Device::Client.new
        @client.stub!(:send_sms).and_return(true)
        @device.stub!(:client).and_return(@client)
      end

      it "should raise an error if the sms is not filled with valid parameters" do
        lambda {
          @device.send_sms do |sms|
            # parameters go here
          end
        }.should raise_error(Texty::Exception::InvalidSmsException)
      end

      it "should not attempt to send the sms" do
        @client.should_not_receive(:send_sms)

        lambda {
          @device.send_sms do |sms|
            # parameters go here
          end
        }.should raise_error(Texty::Exception::InvalidSmsException)
      end
    end
  end
end
