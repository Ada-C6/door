require_relative 'spec_helper'
require_relative '../door'

describe Door do
  describe "#initialize" do
    it "should initialize a new instance of Door" do
      sample = Door.new(true, true)
      sample.must_be_instance_of(Door)
    end
  end

  describe "#write(words)" do
    it "should write the inscription on the Door" do
      sample = Door.new(true, true)
      sample.write("I'm a door")
      sample.inscription.must_equal("I'm a door")
    end

    it "should raise an error if the words are already inscribed" do
      sample = Door.new(true, true)
      sample.write("I'm a door")
      proc { sample.write("No I'm not") }.must_raise(ArgumentError)
    end
  end

  describe "#open" do
    it "should open a Door iff it is unlocked && closed" do
      sample = Door.new(true, false)
      sample.open
      sample.closed.must_equal(false)
    end

    bad_doors = [Door.new(false, true), Door.new(false, false), Door.new(true, true) ]

    bad_doors.each do |sample|
      it "should raise an error if door is locked" do
        proc { sample.open }.must_raise(ArgumentError)
      end
    end
  end

  describe "#close" do
    it "should only close a Door iff it is open ie closed == false" do
      sample = Door.new(false, false)
      sample.close
      sample.closed.must_equal(true)
    end

    it "should raise an error if it is closed" do
      sample = Door.new(true, false)
      proc { sample.close }.must_raise(ArgumentError)
    end
  end

  describe "#lock" do
    it "should lock a door iff it is unlocked" do
      sample = Door.new(false, false)
      sample.lock
      sample.locked.must_equal(true)
    end

    it "should raise an error if it is locked" do
      sample = Door.new(true, true)
      proc { sample.lock }.must_raise(ArgumentError)
    end
  end

  describe "#unlock" do
    it "should unlock a door iff it is locked" do
      sample = Door.new(false, true)
      sample.unlock
      sample.locked.must_equal(false)
    end

    it "should raise an error it it is unlocked" do
      sample = Door.new(true, false)
      proc { sample.unlock }.must_raise(ArgumentError)
    end
  end

end
