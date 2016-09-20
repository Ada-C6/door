require_relative 'spec_helper'
require_relative '../door'

describe Door do
  before(:each) do
    @door = Door.new
  end

  describe "#initialize" do

    it "must create an instance of Door" do
        @door.must_be_instance_of(Door)
    end

  end

  describe "#inscribe(words)" do
    it "should allow someone to write on a blank door" do
      @door.inscribe("something")
      @door.inscription.must_equal("something")
    end

    # I thought about raising a RuntimeError here, and tested it that way at first,
    # but thought for a game that that wasn't a particularly "graceful" or useful error.
    it "should not allow someone to write on a door which has already been written on" do
      @door.inscribe("something")
      @door.inscribe("something else").must_equal("something")
    end
  end

  # I know the attr_reader will handle this just fine without another method. However,
  # I didn't know of a way to return the second requirement with just an attr_reader.
  describe "#read" do
    it "should allow someone to read an inscription" do
      @door.must_respond_to(:inscription)
    end

    it "should say 'THIS DOOR IS BLANK' if a door hasn't been written on" do
      @door.read.must_equal("THIS DOOR IS BLANK")
    end
  end

end
