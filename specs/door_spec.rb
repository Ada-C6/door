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

    it "should say if a Door is open" do
      @door.must_respond_to(:opened)
    end

    it "should say if a Door is locked" do
      @door.must_respond_to(:locked)
    end

    it "should say if there is writing on the Door" do
      @door.must_respond_to(:inscription)
    end

  end

  describe "#inscribe(words)" do
    it "should allow someone to write on a blank door" do
      @door.inscribe("something")
      @door.inscription.must_equal("something")
    end

    it "should not prevent writing on a door that's already been written on" do
      @door.inscribe("something")
      proc { @door.inscribe("something else") }.must_raise(RuntimeError)
    end
  end

  describe "#read" do
    # I know the attr_reader will handle this just fine without another
    # method. But I'm keeping this method, mostly because it makes sense
    # to me from a design perspective, and also allows me to puts a more
    # useful descriptor for an empty @inscription value.

    it "must return the inscription" do
      @door.read.must_equal(@door.inscription)
    end
  end

  describe "#open_door" do
    it "must open a closed door" do
      @door.open_door
      @door.opened.must_equal(true)
    end

    it "should not allow a user to open a locked door" do
      @door.lock_door
      proc {@door.open_door}.must_raise(RuntimeError)
    end

    it "should not allow a user to open a door that's already open" do
      @door.open_door
      proc { @door.open_door }.must_raise(RuntimeError)
    end
  end

  describe "#lock_door" do
    it "must lock an unlocked door" do
      @door.lock_door
      @door.locked.must_equal(true)
    end

    # My reasoning:
    # If the lock is a deadbolt and the door is open,
    # locking a deadbolt does not really lock the
    # door. If anything, since it prevents the door from
    # closing, it's worse than unlocked.
    # If the lock is not a deadbolt, locking such a door
    # has other consequences: you might get locked out of
    # of a room with no way of getting back in, for example,
    # or the lock mechanism might prevent you from locking
    # an open door in the first place, as many often do.
    it "should not lock an open door" do
      @door.open_door
      proc { @door.lock_door }.must_raise(RuntimeError)
    end

    it "should not lock a door that is already locked" do
      @door.lock_door
      proc { @door.lock_door }.must_raise(RuntimeError)
    end
  end

  describe "#close_door" do
    it "must close an open door" do
      @door.open_door
      @door.close_door.must_equal(false)
    end

    it "must not close a door that is already closed" do
      proc { @door.close_door }.must_raise(RuntimeError)
    end
  end

  describe "#unlock_door" do
    it "must unlock a locked door" do
      @door.lock_door
      @door.unlock_door
      @door.locked.must_equal(false)
    end

    it "should not unlock a door that is unlocked" do
      proc {@door.unlock_door}.must_raise(RuntimeError)
    end
  end

end
