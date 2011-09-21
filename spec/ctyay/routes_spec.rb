require 'spec_helper'

describe Ctyay::Route do

  context "attributes" do
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
  end

  context "accesing api data" do
    include Ctyay
    let(:route_xml) { File.read("spec/data/routes.example.xml") }
    let!(:route1) { double("Route") }
    let!(:route2) { double("Route") }
    let!(:route3) { double("Route") }
    before do
      Config.bus_api_key = 123
      FakeWeb.register_uri(:get,
                           "http://www.ctabustracker.com/bustime/api/v1/getroutes?key=123",
                           :body => route_xml)
        Route.should_receive(:new).with("1", "Indiana/Hyde Park").and_return(route1)
        Route.should_receive(:new).with("2", "Hyde Park Express").and_return(route2)
        Route.should_receive(:new).with("3", "King Drive").and_return(route3)
        route1.stub(:short_name).and_return( 1 )
        route2.stub(:short_name).and_return( 2 )
        route3.stub(:short_name).and_return( 3 )
    end

    describe ".route" do
      before do
      end
      it "returns a route" do
        Route.route(1).should == route1
      end
    end

    describe ".all" do
      before do
      end
      it "returns a collection of routes" do
        Route.all.should == [route1, route2, route3]
      end
    end
  end
end
