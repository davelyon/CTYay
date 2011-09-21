require 'spec_helper'

describe Ctyay::Request do
  subject { Ctyay::Request }
  describe "#new" do
    before do
      Ctyay::Config.bus_api_key = "123"
    end

    it "includes an API key" do
      subject.new.url.should include("?key=123")
    end

    context "with action" do
      it "returns an http request with that action" do
        subject.new('route').url.should include('route')
      end
    end
  end
end
