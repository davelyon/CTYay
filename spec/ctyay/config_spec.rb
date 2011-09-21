require 'spec_helper'
require 'ctyay/config'
describe Ctyay::Config do
  context "bus api" do
    it "holds your key" do
      subject.bus_api_key = "bus_api_key"
      subject.bus_api_key.should == "bus_api_key"
    end
  end
end
