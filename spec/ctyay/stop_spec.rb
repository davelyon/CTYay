require 'spec_helper'

describe Ctyay::Stop do
  let!(:stop_xml) { File.open("spec/data/stops.example.xml") }

  before(:all) do
    Ctyay::Config.bus_api_key = 123
    FakeWeb.register_uri(:get, "http://www.ctabustracker.com/bustime/api/v1/getstops?key=123&rt=20&dir=East%20Bound", :body => stop_xml)
  end

  subject { Ctyay::Stop.new("1", "Lake/Halsted", "42.88842", "-37.66532") }

  describe "#id" do
    it { subject.id.should == "1" }
  end

  describe "#name" do
    it { subject.name.should == "Lake/Halsted" }
  end

  describe "#latitude" do
    it { subject.latitude.should == "42.88842" }
  end

  describe "#longitude" do
    it { subject.longitude.should == "-37.66532" }
  end

  describe "#location" do
    it { subject.location.should == ["42.88842", "-37.66532"] }
  end

  context "remote api access" do

    describe ".all" do
      let(:stop_1) { double("Stop") }
      let(:stop_2) { double("Stop") }
      before do
        Ctyay::Stop.should_receive(:new).with("4727", "1633 W Madison", "41.881408012088", "-87.668516635895").and_return( stop_1 )
        Ctyay::Stop.should_receive(:new).with("449", "Washington & Wabash", "41.883229232153", "-87.625987529755").and_return( stop_2 )
      end

      it "returns a collection of Stops" do
        Ctyay::Stop.all("20", "East Bound").should == [stop_1, stop_2]
      end
    end
  end

end
