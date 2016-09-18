require_relative 'spec_helper'

describe "door" do
  before (:each) do
    @door_open_unlocked = Door.new("open", "unlocked")
  end

  describe "#initialize" do
    it "can create a new instance of Door" do
      @door_open_unlocked.must_be_instance_of(Door)
    end

    it "should handle strings consistently regardless of capitalization" do
      capitalization_door = Door.new("OPEN", "UNLOCKED")
      capitalization_door.position.must_equal("open")
      capitalization_door.lock_status.must_equal("unlocked")
    end

    it "should be initalized with one of two values for position: open and closed" do
      proc { attribute_check_door = Door.new("Ajar", "unlocked") }.must_raise Exception
    end

    it "should be initalized with one of two values for lock_status: locked and unlocked" do
      proc { attribute_check_door = Door.new("open", '¯\_(ツ)_/¯') }.must_raise Exception
    end
  end

  describe "#set_inscription" do
    it "should set the inscription variable to a non-nil value if it is currently nil" do
      @door_open_unlocked.set_inscription("Your Message Here").must_equal("Your Message Here")
    end

    it "should not allow the inscription to be changed once set" do
      @door_open_unlocked.set_inscription("Your Message Here")
      @door_open_unlocked.set_inscription("Can I do the Thing?").wont_equal("Can I do the Thing?")
    end
  end

  describe "#change_door_position" do
    it "should toggle the door position from open to closed if door is unlocked" do
      @door_open_unlocked.change_door_position
      @door_open_unlocked.position.must_equal("closed")
    end

    it "should toggle the door position from closed to open if door is unlocked" do
      door_closed_unlocked = Door.new("closed", "unlocked")
      door_closed_unlocked.change_door_position
      door_closed_unlocked.position.must_equal("open")
    end

    it "should not toggle the door position from closed to open if door is locked" do
      door_closed_locked = Door.new("closed", "locked")
      door_closed_locked.change_door_position
      door_closed_locked.position.must_equal("closed")
    end

    it "should not toggle the door position from open to closed if door is locked" do
      door_open_locked = Door.new("open", "locked")
      door_open_locked.change_door_position
      door_open_locked.position.must_equal("open")
    end
  end

  describe "#change_lock_status" do
    it "should toggle the lock status from unlocked to locked" do
      door_closed_unlocked = Door.new("closed", "unlocked")
      door_closed_unlocked.change_lock_status
      door_closed_unlocked.lock_status.must_equal("locked")
    end

    it "should toggle the lock status from locked to unlocked" do
      door_closed_locked = Door.new("closed", "locked")
      door_closed_locked.change_lock_status
      door_closed_locked.lock_status.must_equal("unlocked")
    end
  end

  describe "#check_inscription" do
    it "should return what inscription is on the door, if applicable" do
      @door_open_unlocked.set_inscription("The cake is a lie.")
      @door_open_unlocked.check_inscription.must_equal("The inscription on this door says: #{@door_open_unlocked.inscription}")
    end

    it "should tell the player if there is no writing on the door" do
      @door_open_unlocked.check_inscription.must_equal("There is no inscription on this door.")
    end
  end

  describe "#check_position" do
    it "should tell the player if the door is open" do
      @door_open_unlocked.check_position.must_equal("open")
    end
  end

    it "should tell the player if the door is closed" do
      door_closed_locked = Door.new("closed", "locked")
      door_closed_locked.check_position.must_equal("closed")
    end

  describe "#check_lock_status" do
    it "should tell the player if the door is unlocked" do
      @door_open_unlocked.check_lock_status.must_equal("unlocked")
    end

    it "should tell the player if the door is locked" do
      door_closed_locked = Door.new("closed", "locked")
      door_closed_locked.check_lock_status.must_equal("locked")
    end
  end
end
