require_relative 'spec_helper'

describe Door do
  let(:new_door) { Door.new }
  describe "#initialize" do
    it "should create a new instance of Door" do
      Door.new.must_be_instance_of(Door)
    end
  end

  describe "#inscribe" do
    it "should raise an error if given input that is not a string" do
      proc { new_door.inscribe(4) }.must_raise(ArgumentError)
      proc { new_door.inscribe(Door.new) }.must_raise(ArgumentError)
      proc { new_door.inscribe(nil) }.must_raise(ArgumentError)
    end

    it "should return a message if the inscription is longer than 20 characters" do
      new_door.inscribe("This is a very long inscription. It should not work on the door because I want to challenge the player to write what they want to remember in only a few characters. If they had an unlimited amount of space, they could write a novel on the door or cheat or something. Don't let them do that. I don't like that.").must_equal("Please try again. Inscription must be less than 20 characters.")
      new_door.inscribe("a" * 21).must_equal("Please try again. Inscription must be less than 20 characters.")
    end

    it "should return a message if there is already an inscription on the door" do
      new_door.inscribe("Allison's Door")
      new_door.inscribe("Matt's Door").must_equal("Door already inscribed. Cannot overwrite.")
    end
  end

  describe "#open_door" do
    it "should open a closed and unlocked door" do
      new_door.unlock
      new_door.open_door
      new_door.open_state.must_equal(:open)
    end

    it "should return a message if the door is locked when trying to open" do
      new_door.open_door.must_equal("Door locked. Please unlock to open.")
    end

    it "should return a message if the door is already open when trying to open an open door" do
      new_door.unlock
      new_door.open_door
      new_door.open_door.must_equal("Door already open.")
    end
  end

  describe "#close_door" do
    it "should close an open door" do
      new_door.unlock
      new_door.open_door
      new_door.close_door
      new_door.open_state.must_equal(:closed)
    end

    it "should return a message if the door is already closed if trying to close a closed door" do
      new_door.close_door.must_equal("Door already closed.")
    end
  end

  describe "#unlock" do
    it "should unlock a locked door" do
      new_door.unlock
      new_door.lock_state.must_equal(:unlocked)
    end

    it "should return a message that the door is already unlocked if trying to unlock an unlocked door" do
      new_door.unlock
      new_door.unlock.must_equal("Door already unlocked.")
    end
  end

  describe "#lock" do
    it "should lock an unlocked door" do
      new_door.unlock
      new_door.lock
      new_door.lock_state.must_equal(:locked)
    end

    it "should return a message that the door is already locked if trying to lock a locked door" do
      new_door.lock.must_equal("Door already locked.")
    end
  end

  describe "#status" do
    it "should return a hash" do
      new_door.status.must_be_kind_of(Hash)
    end

    it "should return the correct status" do
      new_door.status[:inscription_status].must_equal(nil)
      new_door.status[:open_status].must_equal(:closed)
      new_door.status[:lock_status].must_equal(:locked)

      new_door.inscribe("Allison's Door")
      new_door.unlock
      new_door.open_door
      new_door.status[:inscription_status].must_equal("Allison's Door")
      new_door.status[:open_status].must_equal(:open)
      new_door.status[:lock_status].must_equal(:unlocked)
    end
  end
end
