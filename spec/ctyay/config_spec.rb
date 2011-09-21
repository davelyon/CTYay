require 'spec_helper'

describe Ctyay::Config do
  context "bus api" do
    it "holds your key" do
      Ctyay::Config.bus_api_key = "bus api key"
      Ctyay::Config.bus_api_key.should == "bus api key"
    end
  end
end
