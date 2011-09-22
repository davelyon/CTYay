require 'spec_helper'

describe Ctyay::CTATime do
  describe ".time" do
    let(:time_xml) { File.read("spec/data/time.example.xml") }
    before do
      Ctyay::Config.bus_api_key=123
      FakeWeb.register_uri(:get, "http://www.ctabustracker.com/bustime/api/v1/gettime?key=123", :body => time_xml)
    end

    it "returns the official CTA time" do
      Ctyay::CTATime.time.should == Time.new("20111212 00:00:00")
    end
  end
end
