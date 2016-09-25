require_relative 'spec_helper'
require_relative '../door'

describe Door do
  before (:all) do
    @d = Door.new(true, false)
  end

  describe "#initialize" do
    it "should create a new instance of Door" do
      @d.must_be_instance_of(Door)
    end
  end

  describe "#inscribe(message)" do

    before(:all) do
      @d.inscribe("HEY GURL")
    end

    it "should inscribe the correct string" do
      @d.inscription.must_equal("HEY GURL")
    end

    it "should raise an ArgumentError if the message is already inscribed" do
      proc { @d.inscribe("NEW MESSAGE") }.must_raise(ArgumentError)
    end
  end


  # def initialize(lock, open)
  #   @locked = true
  #   @open = false
  #   @inscription = nil
  # end

  describe "#open_door" do

    it "should raise an ArgumentError if the door was already open" do
      d = Door.new(false, true)
      proc { d.open_door }.must_raise(ArgumentError)
    end

    it "should raise an ArgumentError if the door was locked" do
      d = Door.new(true, false)
      proc { d.open_door }.must_raise(ArgumentError)
    end

    it "should raise an ArgumentError if the door is open and locked" do
      d = Door.new(true, true)
      proc { d.open_door }.must_raise(ArgumentError)
    end
    it "should open the door" do
      if @open == false && @locked == false
        d.open_door.must_equal(true)
      end
    end

  end
end
