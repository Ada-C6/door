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

    # I thought about raising a RuntimeError here, and tested it that way
    # at first, but thought for a game that that wasn't a particularly
    # "graceful" or useful error.
    it "should not allow someone to write on a door which has already been written on" do
      @door.inscribe("something")
      @door.inscribe("something else").must_equal("something")
    end
  end

  describe "#read" do
    # I know the attr_reader will handle this just fine without another
    # method. However, I initially tested it with @inscription equal to
    # nil. It turns out, though, that that came with complications of
    # its own. My first test block, for example, failed if nothing was
    # written in, because it was returning a string "THIS DOOR IS BLANK"
    # instead of nil. Setting @inscription to be "BLANK" initially solved
    # some of this, though I am not entirely happy with this solution either;
    # as unlikely as it seems, if someone did want to inscribe "BLANK" (I
    # don't know why they would, but...), they could inscribe something else
    # afterwards. However, the other problems seemed a bit more likely and
    # more important to solve.
    # So, even though an attr_reader is all one would need, I'm keeping
    # this method, mostly because it makes sense to me from a design
    # perspective.

    it "must return the inscription" do
      @door.read.must_equal(@door.inscription)
    end

    it "should say 'BLANK' if a door hasn't been written on" do
      @door.read.must_equal("BLANK")
    end
  end

  describe "#open_door" do
    it "must open a closed door" do
      @door.open_door
      @door.opened.must_equal(true)
    end

    it "should not allow a user to open a locked door" do
      @door.lock_door
      @door.open_door.must_equal(false)
    end
  end

  describe "#lock_door" do
    it "must lock an unlocked door" do
      @door.lock_door
      @door.locked.must_equal(true)
    end

    # My reasoning:
    # If the lock is a deadbolt and the door is open,
    # locking a deadbolt does not effectively lock the
    # door. If anything, since it prevents the door from
    # closing, it's worse than unlocked.
    # If the lock is not a deadbolt, locking such a door
    # has other consequences: you might get locked out of
    # of a room with no way of getting back in, for example,
    # or the lock mechanism might prevent you from locking
    # an open door in the first place, as many often do.
    it "should not lock an open door" do
      @door.open_door
      @door.lock_door
      @door.locked.must_equal(false)
    end
  end

end
