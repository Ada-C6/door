require_relative 'spec_helper'

describe Door do
  before (:each) do
    @what_door = Door.new
  end
  describe "initialize" do
    # A door should be initalized without an inscription, it will have a position (let's say it is initalized as closed), and a security state (locked).
    it "should be a door object" do
      @what_door.must_be_instance_of(Door)
    end

    it "should not have an inscription" do
      @what_door.inscription.must_equal(nil)
    end

    it "should be closed" do
      @what_door.position.must_equal("closed")
    end

    it "should be locked" do
      @what_door.security.must_equal("locked")
    end
  end

  describe "#inscribe(message)" do
    it "should set the inscription instance variable to the message" do
      # A door object can display an inscription
      @what_door.inscribe("Karin!")
      @what_door.inscription.must_equal("Karin!")
    end
    it "should return an error if door is already inscribed" do
      # A door can only be inscribed once
      @what_door.inscribe("First!")
      proc {@what_door.inscribe("Second.")}.must_raise(RuntimeError)
    end
    it "should return an error if door is open" do
      # A door object can only be inscribed if it's closed (it would be a pain to try and inscribe an open door, what with it swinging back and forth.)
      @what_door.unlock_door
      @what_door.open_door
      proc {@what_door.inscribe("Can I inscribe an open door?")}.must_raise(RuntimeError)
    end
  end

  describe "#open_door" do
    # - be either open or closed, and
    # - You may open a Door if and only if it is unlocked and closed
    it "should set position to 'open' if successful" do
      @what_door.unlock_door
      @what_door.open_door
      @what_door.position.must_equal("open")
    end
    it "should return an error if door is locked" do
      proc {@what_door.open_door}.must_raise(RuntimeError)
    end
    it "should return an error if already open" do
      @what_door.unlock_door
      @what_door.open_door
      proc {@what_door.open_door}.must_raise(RuntimeError)
    end
  end

  describe "#close_door" do
    it "should raise an error if door is locked but open" do
      # - You may close a Door if and only if it is open and not locked
      @what_door.unlock_door #doors are initalized as locked and closed
      @what_door.open_door #doors are initalized as locked and closed
      @what_door.lock_door #after door is open, now lock it
      proc {@what_door.close_door}.must_raise(RuntimeError)
    end
    it "should raise an error if door is already closed" do
      proc {@what_door.close_door}.must_raise(RuntimeError)
    end
    it "should set the position to closed if successful" do
      @what_door.unlock_door
      @what_door.open_door
      @what_door.close_door
      @what_door.position.must_equal("closed")
    end
  end

  describe "#unlock_door" do
    it "should raise an error if door is already unlocked" do
      # You may unlock a Door if and only if it is locked
      @what_door.unlock_door
      proc {@what_door.unlock_door}.must_raise(RuntimeError)
    end
    it "should set security to 'unlocked' if successful" do
      @what_door.unlock_door
      @what_door.security.must_equal("unlocked")
    end
    it "should be successful if door is open" do
      # It does not matter if the door is open or closed to unlock it.
      @what_door.unlock_door # doors are initialized as locked and closed
      @what_door.open_door
      @what_door.lock_door
      @what_door.unlock_door
      @what_door.security.must_equal("unlocked")
    end

  end

  describe "#lock_door" do
    # You may lock a Door if and only if it is unlocked

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
