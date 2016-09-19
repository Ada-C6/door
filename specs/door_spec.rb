require_relative 'spec_helper'
require_relative '../door'

describe Door do
  let(:door) {Door.new}

  describe "#initialize" do
    it "can create a new instance of Game" do
      door.must_be_instance_of(Door)
    end
  end

  describe "#open_if_allowed" do
    it "should raise an Argument Error if locked is true" do
      door.locked = true
      proc { door.open_if_allowed }.must_raise(ArgumentError)
    end

    it "should raise an Argument Error if already open" do
      proc { door.open_if_allowed }.must_raise(ArgumentError)
    end

    it "should open the door, if allowed" do
      if @closed == true && @locked == false
        door.open_if_allowed.must_equal(true)
      end
    end
  end

  describe "#close_if_allowed" do
    it "should raise an Argument Error if locked? is true" do
      door.locked = true
      proc { door.close_if_allowed }.must_raise(ArgumentError)
    end

    it "should raise an Argument Error if closed? is true" do
      proc { door.close_if_allowed }.must_raise(ArgumentError)
    end

    it "should close the door, if allowed" do
      if @closed == true && @locked == false
        door.close_if_allowed.must_equal(true)
      end
    end
  end

  describe "#unlock_door" do
    it "should raise an Argument Error if the door is not locked" do
      proc { door.unlock_door }.must_raise(ArgumentError)
    end

    it "should allow the user to unlock the door by changing locked" do
      door.locked = true
      door.closed = true
      door.unlock_door.must_equal(false)
    end
  end

  describe "#lock_door" do
    it "should raise an Argument Error if the door is already locked" do
      door.locked = true
      proc { door.lock_door }.must_raise(ArgumentError)
    end

    it "should allow the user to lock the door" do
      door.lock_door.must_equal(true)
    end
  end

  describe "#is_door_locked" do
    it "should return true" do
      door.locked = true
      door.is_door_locked.must_equal(true)
    end

    it "should return false" do
      door.is_door_locked.must_equal(false)
    end
  end

  describe "#is_door_closed" do
    it "should return true" do
      door.closed = true
      door.is_door_closed.must_equal(true)
    end

    it "should return false" do
      door.is_door_closed.must_equal(false)
    end
  end

  describe "inscription(text)" do
    it "should return the writing on the door" do
      door.inscription("None shall pass").must_equal("None shall pass")
    end

    it "should raise an Argument Error if the pre-existing description changes" do
      door.inscription("None shall pass")
      proc { door.inscription("Howdy!") }.must_raise(ArgumentError)
    end
  end
end
