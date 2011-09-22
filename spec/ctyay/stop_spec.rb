require 'spec_helper'

describe Ctyay::Stop do
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


end
