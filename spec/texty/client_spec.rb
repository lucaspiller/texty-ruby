require 'spec_helper'

describe Texty::Device::Client do
  describe "initialization" do
    it "should accept an ip address" do
      @client = Texty::Device::Client.new('127.0.0.1')
      @client.ip.should == '127.0.0.1'
    end

    it "should accept a port" do
      @client = Texty::Device::Client.new('127.0.0.1', 80)
      @client.ip.should == '127.0.0.1'
      @client.port.should == 80
    end

    it "should default to port 4930" do
      @client = Texty::Device::Client.new('127.0.0.1')
      @client.ip.should == '127.0.0.1'
      @client.port.should == 4930
    end
  end

  describe "send_sms" do
    before(:each) do
      @client = Texty::Device::Client.new('127.0.0.1')
    end

    it "should create a post request with the parameters" do
      sms = Texty::Sms.new
      sms.destination = '07000000000'
      sms.body = 'Hello!'

      stub_request(:post, "http://#{@client.ip}:#{@client.port}/send_sms").
        with(:body => "{\"sms\":{\"destination\":\"07000000000\",\"body\":\"Hello!\"}}").
        to_return(:status => 201, :body => "", :headers => {})

      @client.send_sms(sms)

      WebMock.should have_requested(:post, "http://#{@client.ip}:#{@client.port}/send_sms").with(:body => sms.to_json)
    end
  end
end
