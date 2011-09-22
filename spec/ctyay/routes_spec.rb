require 'spec_helper'

describe Ctyay::Route do

  let!(:route_xml) { File.read("spec/data/routes.example.xml") }
  let!(:directions_xml) { File.read("spec/data/directions.example.xml") }
  before(:all) do
    Ctyay::Config.bus_api_key = 123
    FakeWeb.register_uri(:get, "http://www.ctabustracker.com/bustime/api/v1/getroutes?key=123", :body => route_xml)
    FakeWeb.register_uri(:get, "http://www.ctabustracker.com/bustime/api/v1/getdirections?key=123&rt=3", :body => directions_xml)
  end

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

    describe "#directions" do
      let(:route_xml) { File.read("spec/data/directions.example.xml") }
      before do
        Ctyay::Route.should_receive(:route).with("3").and_return Ctyay::Route.new("3", "King Drive")
      end
      it "returns the directions" do
        Ctyay::Route.route("3").directions.should == ["North Bound", "South Bound"]
      end
    end
  end

  context "accesing api data" do
    include Ctyay
    let!(:route1) { double("Route") }
    let!(:route2) { double("Route") }
    let!(:route3) { double("Route") }
    before do
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
