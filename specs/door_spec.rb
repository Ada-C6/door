require_relative 'spec_helper'
require_relative '../door'

describe Door do
  describe "#initialize" do
    it "should initialize a new instance of Door" do
      sample = Door.new("I'm a door", true, true)
      sample.must_be_instance_of(Door)
    end
  end

  describe "#open" do
    it "should open a Door iff it is unlocked && closed" do
      sample = Door.new("I'm a door", true, false)
      sample.open
      sample.closed.must_equal(false)
    end

    bad_doors = [Door.new("I'm a door", false, true), Door.new("I'm a door", false, false), Door.new("I'm a door", true, true) ]

    bad_doors.each do |sample|
      it "should raise an error if door is locked" do
        proc { sample.open }.must_raise(ArgumentError)
      end
    end
  end

  describe "#close" do
    it "should only close a Door iff it is open ie closed == false" do
      sample = Door.new("I'm a door", false, false)
      sample.close
      sample.closed.must_equal(true)
    end
  end

  it "should raise an error if it is closed" do
    sample = Door.new("I'm a door", true, false)
    proc { sample.close }.must_raise(ArgumentError)
  end
end
