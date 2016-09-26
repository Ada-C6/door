require_relative 'spec_helper'
require_relative '../door'

describe Door do
  describe "#initialize" do
    it "can create a new instance of Door" do
      Door.new.must_be_instance_of(Door)
    end
    it "creates a closed door" do
      door = Door.new
      door.closed.must_equal(true)
    end
    it "creates an unlocked door" do
      door = Door.new
      door.locked.must_equal(false)
    end

    it "creates a door with no inscription" do
      door = Door.new
      door.inscription.must_equal(nil)
    end
  end

  describe "#open" do
    it "opens the closed door" do
      door = Door.new
      door.open
      door.closed.must_equal(false)
    end

    it "raises an ArgumentError if the door is already open" do
      my_door = Door.new
      my_door.open
      proc {my_door.open}.must_raise(ArgumentError)
    end

    it "raises an ArgumentError if the door is locked" do
      d = Door.new
      d.lock
      proc {d.open}.must_raise(ArgumentError)
    end

  end

  describe "#close" do
    it "closes the open door" do
      d = Door.new
      d.open
      d.close
      d.closed.must_equal(true)
    end

    it "raises an ArgumentError if the door is already closed" do
      door = Door.new
      proc {door.close}.must_raise(ArgumentError)
    end
  end

  describe "#lock" do
    it "locks the door" do
      this_door = Door.new
      this_door.lock
      this_door.locked.must_equal(true)
    end

    it "raises an ArgumentError if the door is already locked" do
      door = Door.new
      door.lock
      proc {door.lock}.must_raise(ArgumentError)
    end
  end

  describe "#unlock" do
    it "unlocks the door" do
    my_door = Door.new
    my_door.lock
    my_door.unlock
    my_door.locked.must_equal(false)
    end

    it "raises an ArgumentError if the door is already unlocked" do
      d = Door.new
      proc {d.unlock}.must_raise(ArgumentError)
    end
  end

  describe "#inscribe" do
    it "inscribes the door" do
      door = Door.new
      door.inscribe("enter here you'll die")
      door.inscription.must_equal("enter here you'll die")
    end
    it "raises an error if argument input is not a string" do
      d = Door.new
      proc {d.inscribe(hi)}.must_raise(NameError)
    end
    it "raises an ArgumentError if the door already has an inscription" do
      my_door = Door.new
      my_door.inscribe("Enter")
      proc {my_door.inscribe("Exit")}.must_raise(ArgumentError)
    end
  end

end
