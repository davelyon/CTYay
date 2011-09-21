require 'spec_helper'

describe Ctyay::Route do
  subject { Ctyay::Route.new("8", "Halsted") }
  describe "#short_name" do
    it { subject.short_name.should == "8" }
  end

  describe "#common_name" do
    it { subject.common_name.should == "Halsted" }
  end

  describe "#description" do
   it { subject.description.should == "8 Halsted" }
  end

  describe ".all" do
    include Ctyay
    let(:route) { stub }
    let(:route_xml) { File.read("spec/data/routes.example.xml") }
    before do
      Ctyay::Config.bus_api_key = 123
      FakeWeb.register_uri(:get,
                           "http://www.ctabustracker.com/bustime/api/v1/getroutes?key=123",
                           :body => route_xml)
    end

    it do
      Route.should_receive(:new).with("1", "Indiana/Hyde Park").and_return(route)
      Route.should_receive(:new).with("2", "Hyde Park Express").and_return(route)
      Route.should_receive(:new).with("3", "King Drive").and_return(route)
      Ctyay::Route.all.should == [route, route, route]
    end
  end
end
