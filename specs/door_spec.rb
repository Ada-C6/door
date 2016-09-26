require_relative 'spec_helper'
require_relative '../door'

describe "Door" do
  let(:unlocked_closed_door) { Door.new(false, true) }
  let(:unlocked_open_door) { Door.new(false, false) }
  let(:locked_closed_door) { Door.new(true, true) }

  describe "#initialize" do
    it "should create a new Door object when initialized with 3 parameters" do
      unlocked_closed_door.must_be_instance_of(Door)
    end

    it "should throw an argument error when initialized without parameters" do
      proc { Door.new }.must_raise(ArgumentError)
    end

    it "should throw an argument error when given a non-boolean argument for 'locked' parameter" do
      proc { Door.new("elphaba", false)}.must_raise(ArgumentError)
    end

    it "should throw an argument error when given a non-boolean argument for 'closed' parameter" do
      proc { Door.new(true, "galinda") }.must_raise(ArgumentError)
    end

    it "should throw an argument error if user attempts to initialize a locked, open door" do
      proc { Door.new(true, false) }.must_raise(ArgumentError)
    end

    it "should have a nil inscription if initialized without an inscription argument" do
      unlocked_closed_door.inscription.must_be_nil
    end
  end #initialize

  describe "#has_inscription?" do
    it "should return false if inscription is nil" do
      unlocked_closed_door.has_inscription?.must_equal(false)
    end

    it "should return true if inscription is not nil" do
      Door.new(false, true, "hello pluto").has_inscription?.must_equal(true)
    end
  end #has_inscription?

  describe "#lock" do
    it "should throw an error if attempting to lock a Door that is already locked" do
      locked_closed_door.is_locked?.must_equal(true)
      proc { locked_closed_door.lock }.must_raise(RuntimeError)
      locked_closed_door.is_locked?.must_equal(true)
    end

    it "should throw an error if attempting to lock a Door that is open" do
      unlocked_open_door.is_locked?.must_equal(false)
      proc { unlocked_open_door.lock }.must_raise(RuntimeError)
      unlocked_open_door.is_locked?.must_equal(false)
    end

    it "should successfully lock a Door that is unlocked and closed" do
      test_locking_door = unlocked_closed_door.clone
      test_locking_door.is_locked?.must_equal(false)
      test_locking_door.lock
      test_locking_door.is_locked?.must_equal(true)
    end
  end #lock

  describe "#unlock" do
    it "should throw an error if attempting to unlock a Door that is already unlocked" do
      unlocked_closed_door.is_locked?.must_equal(false)
      proc { unlocked_closed_door.unlock }.must_raise(RuntimeError)
      unlocked_closed_door.is_locked?.must_equal(false)
    end

    it "should successfully unlock a Door that is locked" do
      test_unlocking_door = locked_closed_door.clone
      test_unlocking_door.is_locked?.must_equal(true)
      test_unlocking_door.unlock
      test_unlocking_door.is_locked?.must_equal(false)
    end
  end #unlock

  describe "#open_door" do
    it "should throw an error if attempting to open a Door that is locked" do
      locked_closed_door.is_closed?.must_equal(true)
      locked_closed_door.is_locked?.must_equal(true)
      proc { locked_closed_door.open_door }.must_raise(RuntimeError)
      locked_closed_door.is_closed?.must_equal(true)
      locked_closed_door.is_locked?.must_equal(true)
    end

    it "should throw an error if attempting to open a Door that is already open" do
      unlocked_open_door.is_closed?.must_equal(false)
      proc { unlocked_open_door.open_door }.must_raise(RuntimeError)
      unlocked_open_door.is_closed?.must_equal(false)
    end

    it "should successfully open a Door that is unlocked and closed" do
      test_opening_door = unlocked_closed_door.clone
      test_opening_door.is_closed?.must_equal(true)
      test_opening_door.open_door
      test_opening_door.is_closed?.must_equal(false)
    end
  end #open_door

  describe "#close_door" do
    it "should throw an error if attempting to close a Door that is already closed" do
      unlocked_closed_door.is_closed?.must_equal(true)
      proc { unlocked_closed_door.close_door }.must_raise(RuntimeError)
      unlocked_closed_door.is_closed?.must_equal(true)
    end

    it "should successfully close a Door that is open" do
      test_closing_door = unlocked_open_door.clone
      test_closing_door.is_closed?.must_equal(false)
      test_closing_door.close_door
      test_closing_door.is_closed?.must_equal(true)
    end
  end #close_door

  describe "#inscribe(inscription)" do
    it "should raise an error if called without an argument" do
      unlocked_open_door.has_inscription?.must_equal(false)
      unlocked_open_door.inscription.must_be_nil
      proc { unlocked_open_door.inscribe }.must_raise(ArgumentError)
      unlocked_open_door.has_inscription?.must_equal(false)
      unlocked_open_door.inscription.must_be_nil
    end

    it "should raise an error if attempting to inscribe a Door which already had an inscription" do
      inscribed_door = Door.new(false, true, "bubbles")
      inscribed_door.inscription.must_equal("bubbles")
      proc { inscribed_door.inscribe("sparkles") }.must_raise(RuntimeError)
      inscribed_door.inscription.must_equal("bubbles")
    end

    it "should successfully add the inscription argument to the Door object if not previously inscribed" do
      unlocked_open_door.inscription.must_be_nil
      unlocked_open_door.has_inscription?.must_equal(false)
      unlocked_open_door.inscribe("abracadabra")
      unlocked_open_door.has_inscription?.must_equal(true)
      unlocked_open_door.inscription.must_equal("abracadabra")
    end
  end #inscribe(inscription)

  describe "#display_inscription" do
    it "should print out the inscription for an inscribed door" do
      inscribed_door = Door.new(false, true, "timbuktu")
      proc { inscribed_door.display_inscription }.must_output("timbuktu\n")
    end

    it "should print out nil for an uninscribed door" do
      proc { unlocked_open_door.display_inscription }.must_output("nil\n")
    end
  end #display_inscription

end # Door
