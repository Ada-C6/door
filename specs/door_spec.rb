require_relative 'spec_helper'

describe Door do
  describe "initialize" do
    # A door should be initalized without an inscription, it will have a position (let's say it is initalized as closed), and a security state (locked).
    let(:new_door) {Door.new}
    it "should be a door object" do
      new_door.must_be_instance_of(Door)
    end

    it "should not have an inscription" do
      new_door.inscription.must_equal(nil)
    end

    it "should be closed" do
      new_door.position.must_equal("closed")
    end

    it "should be locked" do
      new_door.security.must_equal("locked")
    end
  end

  describe "#inscribe(message)" do
    before (:each) do
      @my_door = Door.new
    end
    it "should set the inscription instance variable to the message" do
      # A door object can display an inscription
      @my_door.inscribe("Karin!")
      @my_door.inscription.must_equal("Karin!")
    end
    it "should return an error if door is already inscribed" do
      # A door can only be inscribed once
      @my_door.inscribe("First!")
      proc {@my_door.inscribe("Second.")}.must_raise(RuntimeError)
    end
    it "should return an error if door is open" do
      # A door object can only be inscribed if it's closed (it would be a pain to try and inscribe an open door, what with it swinging back and forth.)
      @my_door.unlock_door
      @my_door.open_door
      proc {@my_door.inscribe("Can I inscribe an open door?")}.must_raise(RuntimeError)
    end
  end

  describe "#open_door" do
    before (:each) do
      @door_too = Door.new
    end
    # - be either open or closed, and
    # - You may open a Door if and only if it is unlocked and closed
    it "should return true if successful" do
      skip
      @door_too.unlock_door
      @door_too.open_door.must_equal(true)
    end
    it "should return an error if door is locked" do
      proc {@door_too.open_door}.must_raise(RuntimeError)
    end
    it "should return an error if already open" do
      skip
      @door_too.unlock_door
      @door_too.open_door
      proc {@door_too.open_door}.must_raise(RuntimeError)
    end
  end

  describe "#close_door" do
    # - You may close a Door if and only if it is open
  end

  describe "#unlock_door" do
    # You may unlock a Door if and only if it is locked
    # It does not matter if the door is open or closed to unlock it.

  end

  describe "#lock_door" do
    # You may lock a Door if and only if it is unlocked
    # If you lock a Door while it's open, you cannot close it until you unlock it

  end

  describe "#inscription?" do
    it "should return 'no inscription' if inscription is nil" do
      skip
      # If door object is not inscribed, what should happen?
    end

    it "should return the inscription message" do
      skip
      # If inscribed, return the message.
    end

  end
end

# A `Door` object can
#
# - be either locked or unlocked
#
# Here are some rules about how Doors work:
#
# - Once the writing (inscription) on a Door is set, it cannot be changed
# - You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.
#
# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
