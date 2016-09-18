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

    it "should raise an error if the inscription is longer than 20 characters" do
      proc { new_door.inscribe("This is a very long inscription. It should not work on the door because I want to challenge the player to write what they want to remember in only a few characters. If they had an unlimited amount of space, they could write a novel on the door or cheat or something. Don't let them do that. I don't like that.")}.must_raise(ArgumentError)
      proc { new_door.inscribe("a" * 21)}.must_raise(ArgumentError)
    end

    it "should raise an error if there is already an inscription on the door" do
      new_door.inscribe("Allison's Door")
      proc { new_door.inscribe("Matt's Door") }.must_raise(ArgumentError)
    end
  end

  describe "#open_door" do
    it "should open a closed door" do
      new_door.open_door
      new_door.open_state.must_equal(:open)
    end

    it "should raise an argument error if the door is already open" do
      new_door.open_door
      proc { new_door.open_door }.must_raise(ArgumentError)
    end
  end

  describe "#close_door" do
    it "should close an open door" do
      new_door.open_door
      new_door.close_door
      new_door.open_state.must_equal(:closed)
    end

    it "should raise an argument error if the door is already closed" do
      proc { new_door.close_door }.must_raise(ArgumentError)
    end
  end

  describe "#unlock" do
    it "should unlock a locked door" do
      new_door.unlock
      new_door.lock_state.must_equal(:unlocked)
    end

    it "should raise an argument error if the door is already unlocked" do
      new_door.unlock
      proc { new_door.unlock }.must_raise(ArgumentError)
    end
  end

  
end
