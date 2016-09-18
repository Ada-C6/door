require_relative 'spec_helper'

describe "Door" do
  before (:each) do
    @door_open_unlocked = Door.new("open", "unlocked")
    # I could have put the below in before (:each) blocks at their applicable method describes,
    # (to avoid initializing them needlessly at each test.) This would have been less DRY though.
    # Because the spec file does not take long to rake, I took the more DRY approach.
    @door_closed_locked = Door.new("closed", "locked")
    @door_closed_unlocked = Door.new("closed", "unlocked")
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
      @door_open_unlocked.set_inscription("Can I do the Thing?").must_equal("Your Message Here")
    end
  end

  describe "#close_door" do
    it "should toggle the door position from open to closed if door is unlocked" do
      @door_open_unlocked.close_door
      @door_open_unlocked.position.must_equal("closed")
    end

    # Uncomment first 4 lines below if intent was for door to not close when locked/open due to a deadbolt.
    # it "should not toggle the door position from open to closed if door is locked" do
    #   door_open_locked = Door.new("open", "locked")
    #   door_open_locked.close_door.must_equal("open")
    # end
    # Alternatively I could have created a third state "ajar" for this configuration,
    # but did not because the specification indicated 2 possible states.
  end

  describe "#open_door" do
    it "should toggle the door position from closed to open if door is unlocked" do
      @door_closed_unlocked.open_door
      @door_closed_unlocked.position.must_equal("open")
    end

    it "should not toggle the door position from closed to open if door is locked" do
      @door_closed_locked.open_door
      @door_closed_locked.position.must_equal("closed")
    end
  end

  describe "#lock_door" do
    it "should toggle the lock status from unlocked to locked" do
      @door_closed_unlocked.lock_door
      @door_closed_unlocked.lock_status.must_equal("locked")
    end
  end

  describe "#unlock_door" do
    it "should toggle the lock status from locked to unlocked" do
      @door_closed_locked.unlock_door
      @door_closed_locked.lock_status.must_equal("unlocked")
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

  describe "#check_door_position" do
    it "should tell the player whether the door is open or closed" do
      @door_open_unlocked.check_door_position.must_equal("This door is #{@door_open_unlocked.position}.")
    end
  end

  describe "#check_lock_status" do
    it "should tell the player the status of the lock" do
      @door_open_unlocked.check_lock_status.must_equal("This door is #{@door_open_unlocked.lock_status}.")
    end
  end
end
