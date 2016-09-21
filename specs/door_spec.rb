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

    it "should return a door without an inscription if the input is greater than 20 characters" do
      new_door.inscribe("This is a very long inscription. It should not work on the door because I want to challenge the player to write what they want to remember in only a few characters. If they had an unlimited amount of space, they could write a novel on the door or cheat or something. Don't let them do that. I don't like that.").must_equal(nil)
      new_door.inscribe("a" * 21).must_equal(nil)
    end

    it "should return the original inscription if user tries to re-inscribe" do
      new_door.inscribe("Allison's Door")
      new_door.inscribe("Matt's Door").must_equal("Allison's Door")
    end
  end

  describe "#open_door" do
    it "should open a closed and unlocked door" do
      new_door.unlock
      new_door.open_door
      new_door.open_state.must_equal(:open)
    end

    it "should return a value of :closed for the open_state property if trying to open a locked door" do
      new_door.open_door.must_equal(:closed)
    end

    it "should return return a value of :open when trying to open an already open door" do
      new_door.unlock
      new_door.open_door
      new_door.open_door.must_equal(:open)
    end
  end

  describe "#close_door" do
    it "should close an open door" do
      new_door.unlock
      new_door.open_door
      new_door.close_door
      new_door.open_state.must_equal(:closed)
    end

    it "should return a value of :closed when trying to close an already closed door" do
      new_door.close_door.must_equal(:closed)
    end
  end

  describe "#unlock" do
    it "should unlock a locked door" do
      new_door.unlock
      new_door.lock_state.must_equal(:unlocked)
    end

    it "should return a value of :unlocked when trying to unlock an already unlocked door" do
      new_door.unlock
      new_door.unlock.must_equal(:unlocked)
    end
  end

  describe "#lock" do
    it "should lock an unlocked door" do
      new_door.unlock
      new_door.lock
      new_door.lock_state.must_equal(:locked)
    end

    it "should return a value of :locked when trying to lock an already locked door" do
      new_door.lock.must_equal(:locked)
    end
  end

  describe "#open_status" do
    it "should return a value of open when the door has been opened" do
      new_door.unlock
      new_door.open_door
      new_door.open_status.must_equal(:open)
    end

    it "should return a value of cloed when the door is closed" do
      new_door.open_status.must_equal(:closed)
    end
  end

  describe "#lock_status" do
    it "should return a value of locked when the door is locked" do
      new_door.lock_status.must_equal(:locked)
    end

    it "should return a value of unlocked when the door is unlocked" do
      new_door.unlock
      new_door.lock_status.must_equal(:unlocked)
    end
  end

  describe "#read_inscription" do
    it "should return nil when no inscription has been made" do
      new_door.read_inscription.must_equal(nil)
    end

    it "should return the correct inscription when one has been made" do
      new_door.inscribe("Employees only")
      new_door.read_inscription.must_equal("Employees only")
    end
  end
end
