require_relative 'spec_helper'
require_relative '../door.rb'

describe Door do
  let(:door) { Door.new }

  describe "#initialize" do
    it "creates a new instance of Door" do
      door.must_be_instance_of(Door)
    end
  end

  describe "#inscribe" do
    d = Door.new
    d.inscribe("YOLO")

    it "should inscribe a message" do
      d.inscription.must_equal("YOLO")
    end

    it "should raise an ArgumentError if the message is already inscribed" do
      proc { d.inscribe("Carpe Diem") }.must_raise(ArgumentError)
    end
  end

  describe "#lock" do
    before(:each) do
      @d = Door.new
    end

    it "should lock the door (@locked will equal true)" do
      @d.lock
      @d.locked.must_equal(true)
    end

    it "should raise an ArgumentError if the door is already locked" do
      @d.lock
      proc { @d.lock }.must_raise(ArgumentError)
    end
  end

  describe "#unlock" do
    before(:each) do
      @e = Door.new
    end

    it "should unlock the door (@locked will equal false)" do
      @e.lock
      @e.unlock
      @e.locked.must_equal(false)
    end

    it "should raise an ArgumentError if the door is already unlocked" do
      proc { @e.unlock }.must_raise(StandardError)
    end
  end

  describe "#open" do
    before(:each) do
      @f = Door.new
    end

    it "should open the door if it was closed and unlocked" do
      @f.open
      @f.closed.must_equal(false)
    end

    it "should raise an Argument Error if the door was already open" do
      @f.open
      proc { @f.open }.must_raise(ArgumentError)
    end

    it "should raise an Argument Error if the door was locked" do
      @f.lock
      proc { @f.open }.must_raise(ArgumentError)
    end
  end
  
  describe "#close" do
    before(:each) do
      @g = Door.new
    end

    it "should close the door if it was open and unlocked" do
      @g.open
      @g.close
      @g.closed.must_equal(true)
    end

    it "should raise an Argument Error if the door was already closed" do
      proc { @g.close }.must_raise(ArgumentError)
    end

    it "should raise an Argument Error if the door was locked" do
      @g.lock
      proc { @g.close }.must_raise(ArgumentError)
    end
  end

end
