require_relative 'spec_helper'

describe MainDoor do
  describe "#initialize" do
    it "can create a new instance of MainDoor" do
      fridge = MainDoor.new
      fridge.must_be_instance_of(MainDoor)
    end

  end
  describe "#inscribe" do
    it "can set a value for the inscription" do
      fridge = MainDoor.new
      fridge.inscribe("yummy")
      fridge.name.must_equal("yummy")
    end

    it "cannot have the value of name change" do
      fridge = MainDoor.new
      fridge.inscribe("yummy")
      fridge.inscribe("cake")
      fridge.name.must_equal("yummy")
    end

    it "will raise and error if you try to set a value other than a string" do
      fridge = MainDoor.new
      proc { fridge.inscribe(11)}.must_raise(ArgumentError)
    end

    it "will raise and error if the strings are not all letters" do
      fridge = MainDoor.new
      proc {fridge.inscribe("11")}.must_raise(ArgumentError)
    end
    it "will raise an error if the string is empty" do
      fridge = MainDoor.new
      proc {fridge.inscribe("")}.must_raise(ArgumentError)
    end
  end

  describe "#check_state" do
    it "should return the state of the door" do
      fridge = MainDoor.new
      fridge.check_state.must_equal("open")
    end
  end
  describe "#slam" do
    it "should change the state if you slam the door" do
      fridge = MainDoor.new
      fridge.slam
      fridge.check_state.must_equal("closed")
    end
    it "should not allow a closed door to be slammed" do
      fridge = MainDoor.new
      fridge.slam
      fridge.check_state
      proc {fridge.slam}.must_raise(ArgumentError)
    end
  end
  describe "#swing" do
    it "should raise Arguement if door is already closed and the door should remain closed" do
      fridge = MainDoor.new
      fridge.slam
      fridge.check_state
      proc {fridge.swing}.must_raise(ArgumentError)
    end
  end
  describe "#lock_check" do
    it " can check if the door is locked" do
      fridge = MainDoor.new
      fridge.lock_check.must_equal("unlocked")
    end
  end
end
